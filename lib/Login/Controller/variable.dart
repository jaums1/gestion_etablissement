import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TUserVariable {
   final user =TextEditingController();
  final password =TextEditingController();
  final passwordConfirm =TextEditingController();
  final role =TextEditingController();

   final hidePassword  = true.obs;
  final hidePasswordConfirm  = true.obs;
  final rememberMe    = false.obs;

  final loginFromKey = GlobalKey<FormState>();

  final registerFromKey = GlobalKey<FormState>();

  final codekey = GlobalKey<FormState>();

  void clear(){
    user.clear();
    password.clear();
    passwordConfirm.clear();
    role.clear();
  }
}