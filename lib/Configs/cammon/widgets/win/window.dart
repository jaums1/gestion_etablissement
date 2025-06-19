// import 'dart:ui';

import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:window_manager/window_manager.dart';
class TWindow extends GetxController{
  static TWindow get instance => Get.find();
   final win = appWindow;
   ///Maximiser Fenetre
   Future<void> maximizeWindow() async{
    await windowManager.maximize();
   } 
   
   //// Minimiser Fenetre
    Future<void> minimizeWindow() async{
    await windowManager.minimize();
   }
    
   //// Cacher Fenetre
   Future<void> hideWindow() async{
    await windowManager.hide();
   }  

   //// Restore Fenetre
   Future<void> restoreWindow() async{
    await windowManager.restore();
   }
  
   //// Fermer Fenetre
   static Future<void> closeWindow() async{
    await windowManager.close();
   }
  
   //// Montrer Fenetre
   Future<void> showWindow() async{
    await windowManager.show();
   }

   //// Opacity Fenetre
  Future<void> opacityWindow({double? opacity=0.95}) async{
    await windowManager.setOpacity(opacity!);
   }
  
   //// Taille Fenetre
  Future<void> sizeWindow({double? width,double? height}) async{
    await windowManager.setSize(Size(width!, height!));
   }
 
   //// Arrondi Fenetre
  //  static Future<void> raduisWindow({double? width=800,double? height=600}) async{
  //   await windowManager.ra;
  //  }

  

     //// Fenetre Login
  Future<void> loginWindow() async{
    await sizeWindow(width: 550,height: 500);
    await showWindow();
    await windowManager.focus();
    await windowManager.setResizable(false);
    await windowManager.setTitleBarStyle(windowButtonVisibility: false,TitleBarStyle.hidden);
   
   }
  
  //// Modifier Fenetre
   void updateWindow({double? largeur=400,double? hauteur=570,bool? redimention=false,Alignment? newAlignment=Alignment.center})async {
    
      final initialSize = Size(largeur!, hauteur!);
      win.minSize = initialSize;
       win.size = initialSize;
       win.alignment = newAlignment;
      //  await windowManager.center();
    //  await windowManager.setSize(initialSize,animate: true);
    //  await windowManager.setResizable(redimention!);
    //  await windowManager.show();
   }

   ///// 
   void changeDimensionFenetre({double? largeur =400,double? hauteur=570,bool? redimention=false,TitleBarStyle? titleBarStyle =TitleBarStyle.hidden })async{
    appWindow.size =  Size(largeur!, hauteur!);
    await windowManager.setResizable(redimention!);
    await windowManager.setTitleBarStyle(titleBarStyle!);
     appWindow.show();
   }

   //// FULLSCREEN
   Future<void> FullWindow() async{
    await windowManager.setFullScreen(true);
    await windowManager.setResizable(true);
    await windowManager.setTitleBarStyle(TitleBarStyle.normal);
     appWindow.show();
   } 
}



   