import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controller/page_niveau_serie_model.dart';

class TNiveauSeriePrincipalScreen extends StatelessWidget {
  const TNiveauSeriePrincipalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final  controller = Get.put(TPageNiveauSerieController());
    return Obx(() => controller.pageTable[controller.currentPage.value]);
  }
}