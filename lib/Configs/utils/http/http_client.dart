
import 'dart:convert';
import 'dart:io';

import 'package:ecole/Configs/utils/Constant/image_string.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
class THttpHelper {
  static const String _baseUrl="http://localhost";///// URL

  ///// Helper method to make GET request
  
  static  get(String endpoint)async{
     final response=await  http.get(Uri.parse('$_baseUrl/$endpoint'),
     headers: {
      'content-type':'application/json',
     }
     
     );
     
     return _handleResponse(response);
  }

  ///// Helper method to make POST request
  static Future<Map<String,dynamic>> post(String endpoint,dynamic data)async{
       
      final response=await  http.post(Uri.parse('$_baseUrl/$endpoint'),
       headers: {
        // "Access-Control-Allow-Origin": "*",
        'content-type':'application/json',
        // 'Accept': '*/*',
        },
       body:  json.encode(data),  
        );
       
        return  _handleResponse(response);
        
  }
  ///// Helper method to make PUT request
  static Future<Map<String,dynamic>> put(String endpoint,dynamic data)async{
      final response=await  http.put(Uri.parse('$_baseUrl/$endpoint'),
       headers: {'Content-Type':'application/json'},
       body: json.encode(data)    
        );
        
        return _handleResponse(response);
  } 
  ///// Helper method to make PATCH request
  static Future<Map<String,dynamic>> patch(String endpoint,dynamic data)async{
      final response=await  http.patch(Uri.parse('$_baseUrl/$endpoint'),
       headers: {'Content-Type':'application/json'},
       body: json.encode(data)    
        );
        return _handleResponse(response);
  } 
  
  ///// Helper method to make DELETE request
  static Future<Map<String,dynamic>> delete(String endpoint)async{
      final response=await  http.delete(Uri.parse('$_baseUrl/$endpoint'),
       headers: {
      'content-type':'application/json',
     } );
        return _handleResponse(response);
  }
 
 ///// Helper Methode POST to make MMULTIPART request
 static Future<Map<String, dynamic>> postMultipart(String endpoint,dynamic data ,File? files) async {
  var request = http.MultipartRequest('POST', Uri.parse('$_baseUrl/$endpoint'));
  request.fields['user']="Jaums";
  
  // addAll(data);
   var images =await http.MultipartFile.fromPath('Logo',files!.path,
       filename: basename(files.path), // nom de fichier
   );
  request.files.add(images);
  try {
    var streamedResponse = await request.send();
    final response = await http.Response.fromStream(streamedResponse);
    return _handleResponse(response);
  } catch (e) {
    return {'error': e.toString()};
  }
}

 ///// Helper Methode PATCH to make MMULTIPART request
 static Future<Map<String, dynamic>> patchMultipart(String endpoint,dynamic data ,List<http.MultipartFile>? files) async {
  var request = MultipartPatchRequest('$_baseUrl/$endpoint');
  request.fields.addAll(data);
  request.files.addAll(files??[]);
  
  try {
    var streamedResponse = await request.send();
    final response = await http.Response.fromStream(streamedResponse);
    print(response.body);
    return _handleResponse(response);
  } catch (e) {
    return {'error': e.toString()};
  }
}

 ////// TEST
 static Future<Map<String, dynamic>> testMultipart() async {
  var request = http.MultipartRequest('POST', Uri.parse('$_baseUrl/Etudiant'));
   final jsonData = {
    "nom": "Ulrich",
    "description": "Ceci est une image"
  };
  request.fields['meta'] = jsonEncode(jsonData);
  // request.fields.addAll(data);
  // request.
  // var picture = http.MultipartFile.fromPath('Logo',file.path );
  // request.files.add(picture);
  print(request.headers);
  try {
    var streamedResponse = await request.send();
    final response = await http.Response.fromStream(streamedResponse);
    // print(json.decode(response.body));
    return _handleResponse(response);
  } catch (e) {
    return {'error': e.toString()};
  }
}

 
  


   ///// Handle the HTTP response
  //  static Map<String,dynamic> _handleResponse(http.Response response){
   static  _handleResponse(http.Response response){
    
    if (response.statusCode==200  ) {
       return json.decode(response.body);
    }else{
       return json.decode(response.body);
      //  throw Exception("Failled to load data :${response.statusCode} ");
    }
   }
}



class MultipartPatchRequest extends http.MultipartRequest {
  MultipartPatchRequest(String url) : super('PATCH', Uri.parse(url));
}