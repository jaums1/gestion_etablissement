import 'package:ecole/Classe/Controller/classe_filtre.dart';
import 'package:ecole/Configs/utils/Implements/filtre_data.dart';
import 'package:get/get.dart';

import '../../Eleves/Controller/eleve_filtre.dart';
import 'inscription_controller.dart';

class TInscriptionFiltre with TFiltre {
  final controller = Get.find<TInscriptionController>();
  final filtreEleve = TFiltreEleve();
  final filtreClasse = TClasseFiltre();
  
  @override
  void H_FiltreElement({String param = ""}) {
    controller.DataTableFiltreInscription.value = controller.DataTableInscription.where(
      (e) => e.DataEleve!.NomComplet.toString().toLowerCase().contains(param.toLowerCase()) ||
             e.DataClasse!.LibClasse.toString().toLowerCase().contains(param.toLowerCase()) ||
             e.Statut.toString().toLowerCase().contains(param.toLowerCase())
    ).toList();
  }

  @override
  H_FiltreElementParID({int? id}) {
    final index = controller.DataTableInscription.indexWhere((e) => e.IDInscription == id);
    if (index == -1) return false;
    controller.DataInscription.value = controller.DataTableInscription[index];
    filtreClasse.H_FiltreElementParID(id:controller.DataInscription.value.IDClasse );
    filtreEleve.H_FiltreElementParID(id:controller.DataInscription.value.IDEtudiant );
    return true;
  }

  @override
  H_Verification({String param = ""}) {
    final index = controller.DataTableInscription.indexWhere((e) => e.IDInscription.toString().trim().toLowerCase() == param.trim().toLowerCase());
    return index;
  }

  H_VerificationInscription({int? id}){
    final index = controller.DataTableInscription.indexWhere((e) => e.IDEtudiant == id);
    return index;
  }
} 