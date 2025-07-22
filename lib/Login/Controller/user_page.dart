import 'package:ecole/Configs/routes/route.dart';
import 'package:ecole/Configs/utils/Constant/enums.dart';
import 'package:get/get.dart';

import '../../Configs/utils/Implements/page_data.dart';
import 'user_controller.dart';


class TUserPage with TPageData {
  final controller = Get.find<TUserController>();
  @override
  H_PageNouveau() {
    controller.H_Initialise();
    controller.variable.clear();

   
  }

  @override
  H_PageModifier({int? id}) {
    // Get.bottomSheet(Container(
    //   width: 100,
    //   alignment: Alignment.centerLeft,
    //   child: Column(
    //     children: [
    //       ListTile(title: Text("Option 1"),)
    //     ],
    //   ),
    // ));
    // controller.H_RecupeModif(id: id);
    Get.offNamed(TRoutes.registerversement, arguments: TraitementAction.modifier.name);
  }

  
} 