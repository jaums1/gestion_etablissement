import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Configs/utils/Constant/sizes.dart';
import '../../Controller/config_controller.dart';

class TSideBarConfiguartion extends StatelessWidget {
  const TSideBarConfiguartion({super.key});

  @override
  Widget build(BuildContext context) {
    final  controller = Get.find<TConfigController>();
    return Padding(
      padding: const EdgeInsets.only(bottom: TSizes.xs),
      child: ListView.builder(
        itemCount: controller.listeConfig.length,
        itemBuilder: (context, index) {
          String menu = controller.listeConfig[index].menu!;
          return Obx(() {
            bool isCompleted = controller.selectListe.contains(menu);
            return ListTile(
              title: Text(menu),
              leading: Icon(
                isCompleted ? Icons.check_circle : Icons.radio_button_unchecked,
                color: isCompleted? Colors.blue:(isCompleted ? Colors.orange : Colors.grey),
              ),
            );
          });
        },
      ),
    );
  }
}
