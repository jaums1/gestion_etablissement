// import 'dart:async';

// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';

// class NetworkManager extends GetxController {
//   static NetworkManager get instance => Get.find();

//   final Connectivity _connectivity = Connectivity();
//    late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;
//    final RxList<ConnectivityResult> _connectionStatut = <ConnectivityResult>[].obs;

//    @override
//   void onInit() {
//     super.onInit();
//    _connectivitySubscription = _connectivity.onConnectivityChanged.listen(updateConnectionStatut);
 
//   }

//   Future<void> updateConnectionStatut(List<ConnectivityResult> result)async{
//      _connectionStatut.value =result;
//      if(result.contains(ConnectivityResult.none)){

//      }  
//   }

// Future<bool> isConnected() async{
//    try {
//      final result =await _connectivity.checkConnectivity();
//      if (result.any((element)=> element == ConnectivityResult.none)) {
//        return false;
//      }else{
//       return true;
//      }
//    }on PlatformException catch (_) {
//      return false;
//    }
// }
// @override
//   void onClose() {
//     super.onClose();
//     _connectivitySubscription.cancel();
//   }
// }