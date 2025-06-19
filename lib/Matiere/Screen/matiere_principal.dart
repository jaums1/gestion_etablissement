import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controller/page_matiere_controller.dart';



class TMatierePrincipalScreen extends StatelessWidget {
  const TMatierePrincipalScreen({super.key});

  @override
  Widget build(BuildContext context) {
     final controller = Get.find<TPageMatiereController>();
    return Obx(() => controller.pageTable[controller.currentPage.value]);
  }
}