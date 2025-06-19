import 'package:get/get.dart';

class MenuController extends GetxController {
  static MenuController get instance => Get.find();

  final selectPage = 0.obs;
  final tabPage = <String>[].obs;

 void changePageByRoute(String route){
  tabPage.contains(route)==true? null:tabPage.add(route);
   selectPage.value = tabPage.indexOf(route);
   Get.offNamed(tabPage[selectPage.value ], preventDuplicates: false);
 }

}