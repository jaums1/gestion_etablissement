import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Controller/page_matierecoef_controller.dart';




class TMatiereCoefPrincipalScreen extends StatelessWidget {
  const TMatiereCoefPrincipalScreen({super.key});

  @override
  Widget build(BuildContext context) {
     final controller = Get.find<TPageMatiereCoefController>();
    return Obx(() => controller.pageTable[controller.currentPage.value]);
  }
}