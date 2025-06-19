
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TMiddleware extends GetMiddleware {
    
  @override
  RouteSettings? redirect(String? route) {
    return null;
  
      
    // return AuthentificationRepository.instance.isAuthenticated == true? null : const RouteSettings(name: TRoutes.login);
  }
}