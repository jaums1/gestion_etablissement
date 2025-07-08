
import 'dart:convert';

import 'package:http/http.dart' as http;
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