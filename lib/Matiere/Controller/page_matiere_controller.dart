import 'package:get/get.dart';

import '../Screen/Widget/register_matiere.dart';
import '../Screen/matiere.dart';


class TPageMatiereController extends GetxController {
   var currentPage = 0.obs;
   var pageTable =[
    TMatiereScolaireScreen(),
    TRegisterMatiereScreen()];

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