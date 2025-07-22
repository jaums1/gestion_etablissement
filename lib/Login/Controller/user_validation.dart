import 'package:ecole/Configs/routes/route.dart';
import 'package:ecole/Configs/utils/Popup/showdialogue.dart';
import 'package:ecole/Login/Controller/user_filtre.dart';
import 'package:get/get.dart';
import '../../Configs/utils/Constant/enums.dart';
import '../../Configs/utils/Implements/controller_data.dart';
import '../../Configs/utils/Popup/loaders.dart';
import 'user_controller.dart';

class TUserValidation with TControllerData {
  final controller = Get.find<TUserController>();
   final filtre = TUserFiltre();

 H_CreationCompte()async{
  controller.variable.role.text = AppRole.admin.name;
  final result=await controller.H_Enregistrer();
  if(result){
     controller.variable.clear();
     Get.offNamed(TRoutes.login);
     }
 }

H_Connexion()async{
  if(controller.variable.password.text.isEmpty || controller.variable.user.text.isEmpty){
    TLoader.errorSnack(title: "CHAMP",message: "Veuillez renseigner tous les champs");
    return;
  }
  final result=await controller.H_Connexion();
  if(result){
   
    if(controller.DataUser.value.idUtilisateur !=null || controller.DataUser.value.idUtilisateur !=0 )  Get.offNamed(TRoutes.menu); 
   }
  }


@override
  H_Enregistrer() async{
    ////// VERIFICATION
     if (filtre.H_Verification(param: controller.variable.user.text) != -1) {
      TLoader.errorSnack(title: "UTILISATEUR", message: "Cet utilisateur ${controller.variable.user.text}"
      " existe déjà");
      return;
    }
    ////// VALIDATION DES DATAS
    final result = await controller.H_Enregistrer();
    if (result) {
      TLoader.successSnack(title: "ENREGISTRER", message: "Vos données ont été enregistrées");
      Get.offNamed(TRoutes.inscription);
    }
  }

  @override
  H_Modifier() async {
    final result = await controller.H_Modifier();
    if (result) {
      TLoader.successSnack(title: "MODIFIER", message: "Vos données ont été modifiées");
      Get.offNamed(TRoutes.inscription);
    }
  }

  @override
  H_Supprimer({int? id, String? param}) {
    TShowdialogue().showQuestion(
      titre: "Suppression",
      message: "Voulez-vous vraiment supprimer cette inscription?",
      onPressedValide: () => controller.H_Supprimer(id: id),
    );
  }
} 
