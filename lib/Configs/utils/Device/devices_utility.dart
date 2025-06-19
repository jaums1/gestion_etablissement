import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/route_manager.dart';
// import 'package:url_launcher/url_launcher_string.dart';

import '../Constant/sizes.dart';

class TDeviceUtility {

  static void hidekeyboard(BuildContext context){
    FocusScope.of(context).requestFocus(FocusNode()); ///CACHE LE CLAVIER VIRTUEL
  }
  
 static Future <void> setStatutsBarColor(Color color) async{  /// personnaliser la couleur de la barre d'état
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(statusBarColor: color),
  );
 }

static bool isLandscapeOrientation(BuildContext context){
  final viewInsets=View.of(context).viewInsets;
  return viewInsets.bottom==0 ;
}

static void setFullScreen(bool enable){
  SystemChrome.setEnabledSystemUIMode(enable ? SystemUiMode.immersiveSticky : SystemUiMode.edgeToEdge);
}

static bool isPortraitOrientation(BuildContext context){
  final viewInsets=View.of(context).viewInsets;
  return viewInsets.bottom !=0 ;
}

static double getScreenHeight(){
  return MediaQuery.of(Get.context!).size.height;
}

static double getScreenWidht(){
  return MediaQuery.of(Get.context!).size.width;
}

static double getPixedRotio(){
  return MediaQuery.of(Get.context!).devicePixelRatio;
}

static double getStatusBarHeight(){
  return MediaQuery.of(Get.context!).padding.top;
}


  static double getBottomNavigationBarHeight(){
    return kBottomNavigationBarHeight;
  }

  static double getAppBarHeight(){
    return kToolbarHeight;
  }

 static double getKeyBoardHeight(){
  final viewInsets=MediaQuery.of(Get.context!).viewInsets;
    return viewInsets.bottom;
  }
  
  static  Future<bool> isPhysicalDevice() async{
    return defaultTargetPlatform == TargetPlatform.android || defaultTargetPlatform ==  TargetPlatform.iOS;
  }

   static  void vibrate(Duration duration){
    HapticFeedback.vibrate();
    Future.delayed(duration, () => HapticFeedback.vibrate());
  }

  static  Future<void> setPreferreOrientations(List<DeviceOrientation> orientations) async{
    await SystemChrome.setPreferredOrientations(orientations);
  }

  static void hideStatusBar (){
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,overlays: []);
  } 
  
  static void showStatusBar (){
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,overlays: SystemUiOverlay.values);
  }
  
   static Future<bool> hasInternetConnection () async{
    try {
      final result=await InternetAddress.lookup("google.com");
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    }on SocketException catch (_) {
      return false;
    }
  }
  
  static bool isDesktop(){
    
    return Platform.isLinux || Platform.isMacOS || Platform.isWindows;
  }
  static bool isIOS(){
    return Platform.isIOS;
  }

   static bool isAndroid(){
    return Platform.isAndroid;
  } 

  //  static void launchUrl(String url) async{
  //   if (await canLaunchUrlString(url)) {
  //     await launchUrlString(url);
  //   }else{
  //    throw "Could not launch $url"; 
  //   }
  
  // }
  
  static bool isDesktopScreen(BuildContext context){
    return MediaQuery.of(context).size.width >= TSizes.desktopScreenSize;
  }
  static bool isTabletScreen(BuildContext context){
    return MediaQuery.of(context).size.width >= TSizes.tabletScreenSize &&  MediaQuery.of(context).size.width< TSizes.desktopScreenSize;
  }
  static bool isMobileScreen(BuildContext context){
    return MediaQuery.of(context).size.width< TSizes.tabletScreenSize;
  }

}