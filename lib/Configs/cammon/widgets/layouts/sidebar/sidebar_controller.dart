import 'package:get/get.dart';

// import '../../../../../Login/Controller/login_controller.dart';
import '../../../../routes/route.dart';
import '../../../../utils/Device/devices_utility.dart';

class SidebarController extends GetxController {
  static SidebarController get instance => Get.find();
  final  activedItem = TRoutes.etablissement.obs;
  final  hoverItem = "".obs;
  
  void changeActivedItem(String route) => activedItem.value = route;
  void changehoverItem(String route){
    if (!isActived(route)) hoverItem.value = route;
}

  bool isActived(String route) => activedItem.value == route;
  bool isHover(String route) => hoverItem.value == route;

  void menuOnTap(String route){
     if (!isActived(route)) {
        changeActivedItem(route);
        if(TDeviceUtility.isMobileScreen(Get.context!)) Get.back();
        Get.offNamed(route);
     }else{
      
     }
   
  }
}