import 'package:get/get.dart';

import '../Screen/Widget/register_niveau_serie.dart';
import '../Screen/Widget/niveau_serie.dart';

class TPageNiveauSerieController extends GetxController {
   var currentPage = 0.obs;
   var pageTable =[
    TNiveauSerieScreen(),
    TRegisterNiveauSerieScreen(),
   ];

  void nextPage() {
    currentPage.value=1;
  }

  void previousPage() {
     currentPage.value=0;
  }

  void goToPage(int index) {
    currentPage.value = index;
  }
}