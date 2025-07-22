
import 'package:ecole/Login/Controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'route.dart';

class TAuthMiddleware extends GetMiddleware {
    
   
  @override
  RouteSettings? redirect(String? route) {
   
   return TUserController.instance.DataUser.value.idUtilisateur == 0? null : const RouteSettings(name: TRoutes.menu);
  }
}