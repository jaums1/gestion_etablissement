// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'dart:io';

import 'package:ecole/Configs/utils/dio/dio_paginer.dart';


// Classe de réponse générique
class ApiResponse<T> {
  final bool success;
  final T? data;
  final String? message;
  final int? statusCode;
  final Map<String, dynamic>? errors;

  ApiResponse({
    required this.success,
    this.data,
    this.message,
    this.statusCode,
    this.errors,
  });

  factory ApiResponse.success(T data, {String? message, int? statusCode}) {
    return ApiResponse(
      success: true,
      data: data,
      message: message,
      statusCode: statusCode,
    );
  }

  factory ApiResponse.error(String message, {int? statusCode, Map<String, dynamic>? errors}) {
    return ApiResponse(
      success: false,
      message: message,
      statusCode: statusCode,
      errors: errors,
    );
  }
}


//  Classe principale DIO CRUD
class TDioHelper {
  late Dio _dio;
  final String baseUrl;
  final Duration connectTimeout;
  final Duration receiveTimeout;
  final Duration sendTimeout;
  final Map<String, String> defaultHeaders;
  final bool enableLogging;

  TDioHelper({
    required this.baseUrl,
    this.connectTimeout = const Duration(seconds: 30),
    this.receiveTimeout = const Duration(seconds: 120),
    this.sendTimeout = const Duration(seconds: 120),
    this.defaultHeaders = const {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    },
    this.enableLogging = true,
  }) 
  
  {
    _initializeDio();
  }

  void _initializeDio() {
    _dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: connectTimeout,
      receiveTimeout: receiveTimeout,
      sendTimeout: sendTimeout,
      headers: defaultHeaders,
    ));

    // Intercepteur pour logging
    if (enableLogging) {
      _dio.interceptors.add(
        LogInterceptor(
        requestBody: true,
        responseBody: true,
        requestHeader: true,
        responseHeader: true,
        error: true,
      
        logPrint: (obj) => print('DIO: $obj'),
      )
      );
    }

    // Intercepteur pour gestion d'erreurs
    _dio.interceptors.add(
      InterceptorsWrapper(
      onRequest: (options, handler) {
        print('REQUEST: ${options.method} ${options.uri}');
        handler.next(options);
      },
      onResponse: (response, handler) {
        print('RESPONSE: ${response.statusCode} ${response.requestOptions.uri}');
        handler.next(response);
      },
      onError: (error, handler) {
        print('ERROR: ${error.message}');
        handler.next(error);
      },
    )
    );
  }


  // // ===== METHODES CRUD GENERIQUES =====
  
  // CREATE - POST
  Future<ApiResponse<T>> post<T>(
    String endpoint, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
    T Function(dynamic)? fromJson,
  }) async {
    try {
     
       final response = await _dio.post(endpoint,data: data,queryParameters: queryParameters,
      options: Options(headers: headers),
      );
      return _handleResponse<T>(response, fromJson);
    } on DioException catch (e) {
      return _handleError<T>(e);
    }
  }

 
  // READ - GET
  Future<ApiResponse<T>> get<T>(String endpoint, {Map<String, dynamic>? queryParameters,Map<String, String>? headers,
    T Function(dynamic)? fromJson,}) async {
    try {
      final response = await _dio.get(
        endpoint,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );
      return _handleResponse<T>(response, fromJson);
    } on DioException catch (e) {
      return _handleError<T>(e);
    }
  }

  
  // UPDATE - PUT
  Future<ApiResponse<T>> put<T>(String endpoint, {dynamic data,Map<String, dynamic>? queryParameters,Map<String, String>? headers,
    T Function(dynamic)? fromJson,}) async {
    try {
      final response = await _dio.put(endpoint,data: data,queryParameters: queryParameters,options: Options(headers: headers),
      );
      return _handleResponse<T>(response, fromJson);
    } on DioException catch (e) {
      return _handleError<T>(e);
    }
  }

  // UPDATE PARTIAL - PATCH
  Future<ApiResponse<T>> patch<T>(String endpoint, {dynamic data,Map<String, dynamic>? queryParameters,Map<String, String>? headers,
    T Function(dynamic)? fromJson,
  }) async {
    try {
      final response = await _dio.patch(
        endpoint,
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );
     
      return _handleResponse<T>(response, fromJson);
    } on DioException catch (e) {
      return _handleError<T>(e);
    }
  }



  // DELETE
  Future<ApiResponse<bool>> delete(String endpoint, {Map<String, dynamic>? queryParameters,Map<String, String>? headers,
  }) async {
    try {
      final response = await _dio.delete(
        endpoint,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );

      return ApiResponse.success(
        response.statusCode == 200 || response.statusCode == 204,
        statusCode: response.statusCode,
      );
    } on DioException catch (e) {
      return _handleError<bool>(e);
    }
}
// ===== METHODES SPECIALISEES =====

  // GET avec pagination
  Future<ApiResponse<List<T>>> getPaginated<T>(
    String endpoint, {
    required PaginationConfig config,
    required T Function(dynamic) fromJson,
    Map<String, String>? headers,
  }) async {
    
    try {
      final response = await _dio.get(
        endpoint,
        queryParameters: config.toMap(),
        options: Options(headers: headers),
      );

      if (response.data is List) {
        final List<T> items = (response.data as List)
            .map((item) => fromJson(item))
            .toList();
        return ApiResponse.success(items, statusCode: response.statusCode);
      } else if (response.data is Map && response.data['data'] is List) {
        final List<T> items = (response.data['data'] as List)
            .map((item) => fromJson(item))
            .toList();
        return ApiResponse.success(items, statusCode: response.statusCode);
      } else {
        return ApiResponse.error('Format de réponse invalide pour pagination');
      }
    } on DioException catch (e) {
      return _handleError<List<T>>(e);
    }
  }

 
 // GET Liste
  Future<ApiResponse<List<T>>> getList<T>(
    String endpoint, {
    required T Function(dynamic) fromJson,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  }) async {
    try {
      final response = await _dio.get(
        endpoint,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );

      if (response.data is List) {
        final List<T> items = (response.data as List)
            .map((item) => fromJson(item))
            .toList();
        return ApiResponse.success(items, statusCode: response.statusCode);
      } else {
        return ApiResponse.error('La réponse n\'est pas une liste');
      }
    } on DioException catch (e) {
      return _handleError<List<T>>(e);
    }    
  }
  
  
  // ===== UPLOAD DE FICHIERS =====

  // Upload fichier unique
  Future<ApiResponse<T>> uploadFile<T>(
    String endpoint, {
    required File file,
    required String fieldName,
    Map<String, dynamic>? additionalData,
    Map<String, String>? headers,
    T Function(dynamic)? fromJson,
    void Function(int, int)? onProgress,
  }) async {
    try {
    
      FormData formData = FormData.fromMap(
        
        {
      
        "nom": "Ulrich",
        'fichier':
        
        
          await MultipartFile.fromFile(
          file.path,
          filename: file.path.split('/').last,
        ),
        if (additionalData != null) ...additionalData,
      
      },
      );
      
     
   
      final response = await _dio.post(
        endpoint,
         data: formData,
       
        queryParameters: additionalData,
        options: Options(
          contentType: "multipart/form-data",
        headers: {
          'Accept': '*/*',
        }
        ),
        onSendProgress: onProgress,
      );
    
      return _handleResponse<T>(response, fromJson);
    } on DioException catch (e) {
    
      return _handleError<T>(e);
    }
  }

  // Upload fichiers multiples
  Future<ApiResponse<T>> uploadFiles<T>(
    String endpoint, {
    required List<File> files,
    required String fieldName,
    Map<String, dynamic>? additionalData,
    Map<String, String>? headers,
    T Function(dynamic)? fromJson,
    void Function(int, int)? onProgress,
  }) async {
    try {
      Map<String, dynamic> formDataMap = {};

      // Ajouter les fichiers
      for (int i = 0; i < files.length; i++) {
        formDataMap['$fieldName[$i]'] = await MultipartFile.fromFile(
          files[i].path,
          filename: files[i].path.split('/').last,
        );
      }

      // Ajouter les données additionnelles
      if (additionalData != null) {
        formDataMap.addAll(additionalData);
      }

      FormData formData = FormData.fromMap(formDataMap);

      final response = await _dio.post(
        endpoint,
        data: formData,
        options: Options(headers: headers),
        onSendProgress: onProgress,
      );

      return _handleResponse<T>(response, fromJson);
    } on DioException catch (e) {
      return _handleError<T>(e);
    }
  }
  
  // ===== DOWNLOAD DE FICHIERS =====

  // Download fichier
  Future<ApiResponse<String>> downloadFile(
    String endpoint, {
    required String savePath,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
    void Function(int, int)? onProgress,
  }) async {
    try {
      final response = await _dio.download(
        endpoint,
        savePath,
        queryParameters: queryParameters,
        options: Options(headers: headers),
        onReceiveProgress: onProgress,
      );

      return ApiResponse.success(
        savePath,
        statusCode: response.statusCode,
        message: 'Fichier téléchargé avec succès',
      );
    } on DioException catch (e) {
      return _handleError<String>(e);
    }
  }

  // ===== GESTION DES TOKENS =====

  // Ajouter token d'authentification
  void setAuthToken(String token) {
    _dio.options.headers['Authorization'] = 'Bearer $token';
  }

  // Supprimer token d'authentification
  void clearAuthToken() {
    _dio.options.headers.remove('Authorization');
  }

  // ===== INTERCEPTEURS PERSONNALISES =====

  // Ajouter intercepteur personnalisé
  void addInterceptor(Interceptor interceptor) {
    _dio.interceptors.add(interceptor);
  }

  // Intercepteur pour retry automatique
  void addRetryInterceptor({int maxRetries = 3}) {
    _dio.interceptors.add(InterceptorsWrapper(
      onError: (error, handler) async {
        if (error.requestOptions.extra['retryCount'] == null) {
          error.requestOptions.extra['retryCount'] = 0;
        }

        int retryCount = error.requestOptions.extra['retryCount'];
        if (retryCount < maxRetries) {
          error.requestOptions.extra['retryCount'] = retryCount + 1;
          print('Retry ${retryCount + 1}/$maxRetries pour ${error.requestOptions.uri}');
          
          await Future.delayed(Duration(seconds: retryCount + 1));
          
          try {
            final response = await _dio.request(
              error.requestOptions.path,
              data: error.requestOptions.data,
              queryParameters: error.requestOptions.queryParameters,
              options: Options(
                method: error.requestOptions.method,
                headers: error.requestOptions.headers,
              ),
            );
            handler.resolve(response);
          } catch (e) {
            handler.next(error);
          }
        } else {
          handler.next(error);
        }
      },
    ));
  }

  // ===== METHODES UTILITAIRES =====

  // Gestion des réponses
  ApiResponse<T> _handleResponse<T>(Response response, T Function(dynamic)? fromJson) {
    if (response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300) {
      if (fromJson != null) {
        return ApiResponse.success(
          fromJson(response.data),
          statusCode: response.statusCode,
        );
      } else {
        return ApiResponse.success(
          response.data as T,
          statusCode: response.statusCode,
        );
      }
    } else {
      return ApiResponse.error(
        'Erreur HTTP: ${response.statusCode}',
        statusCode: response.statusCode,
      );
    }
  }

  // Gestion des erreurs
  ApiResponse<T> _handleError<T>(DioException error) {
    String message;
    int? statusCode = error.response?.statusCode;

    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        message = 'Timeout de connexion';
        break;
      case DioExceptionType.sendTimeout:
        message = 'Timeout d\'envoi';
        break;
      case DioExceptionType.receiveTimeout:
        message = 'Timeout de réception';
        break;
      case DioExceptionType.badResponse:
        message = 'Erreur serveur: ${error.response?.statusCode}';
        if (error.response?.data != null) {
          if (error.response!.data is Map && error.response!.data['message'] != null) {
            message = error.response!.data['message'];
          }
        }
        break;
      case DioExceptionType.cancel:
        message = 'Requête annulée';
        break;
      case DioExceptionType.unknown:
        message = 'Erreur réseau: ${error.message}';
        break;
      default:
        message = 'Erreur inconnue';
    }

    return ApiResponse.error(
      message,
      statusCode: statusCode,
      errors: error.response?.data is Map ? error.response!.data : null,
    );
  }

  // Fermer les connexions
  void close() {
    _dio.close();
  }
  
  }




  


    
  // }