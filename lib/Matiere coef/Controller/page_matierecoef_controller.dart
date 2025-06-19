import 'package:get/get.dart';
import '../Screen/Widget/register_matierecoef.dart';
import '../Screen/matierecoef.dart';


class TPageMatiereCoefController extends GetxController {
   var currentPage = 0.obs;
   var pageTable =[
    TMatiereCoefScreen(),
    TRegisterMatiereCoefScreen()
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