import 'package:ecole/Code_Projet/Controller/code_projet_controller.dart';
import 'package:ecole/Configs/routes/route.dart';
import 'package:get/get.dart';
import '../../Configs/utils/Implements/controller_data.dart';
import '../../Configs/utils/Popup/loaders.dart';



class TCodeProjetValidation with TControllerData {
  final controller = Get.find<TCodeProjetController>();

 
@override
  H_Modifier() async {
    final result = await controller.H_Modifier();
    if(result){ 
    TLoader.successSnack(title: "MODIFIER",message: "Vos données ont été modifiée");
    Get.offNamed(TRoutes.classe);
    }
  }



}