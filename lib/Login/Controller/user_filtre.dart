import 'package:ecole/Configs/utils/Implements/filtre_data.dart';
import 'package:get/get.dart';
import 'user_controller.dart';


class TUserFiltre with TFiltre {
  final controller = Get.find<TUserController>();
 
  
  @override
  void H_FiltreElement({String param = ""}) {
    controller.DataTableFiltreUser.value = controller.DataTableUser.where(
      (e) => e.dataEmploye!.NomComplet!.contains(param) || e.user!.contains(param)
    ).toList();
  }

  @override
  H_FiltreElementParID({int? id}) {
    final index = controller.DataTableUser.indexWhere((e) => e.idUtilisateur == id);
    if (index == -1) return false;
    controller.DataUser.value = controller.DataTableUser[index];
    return true;
  }

  @override
  H_Verification({String param = ""}) {
    final index =controller.DataTableUser.indexWhere(
      (e)=> e.user.toString().toLowerCase()== param.toLowerCase() 
      );

      return index;
  }

} 