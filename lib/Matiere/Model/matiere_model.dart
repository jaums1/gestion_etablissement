import 'package:ecole/Etablissement/Controller/etablissement_controller.dart';
import 'package:get/get.dart';

class TMatiereModel {
 int? iDMatiere;
 String? codeMatiere;
 String? matiere;
 bool? etat;
 double? coef;
 List <TMatiereModel>? datatable;
 int? iDEtablissement;


TMatiereModel({this.iDMatiere,this.codeMatiere,this.matiere,this.etat,this.datatable,this.coef, this.iDEtablissement});
  
///// RECUPERATION
  factory TMatiereModel.fromMap(Map<String,dynamic> data){
    return TMatiereModel(
     iDMatiere: data.containsKey("IDMatiere")?data["IDMatiere"]:"",
     codeMatiere: data.containsKey("CodeMatiere")?data["CodeMatiere"]:"",
     matiere: data.containsKey("Matiere")?data["Matiere"]:"",
     etat: data.containsKey("Etat")?data["Etat"]:"",
     iDEtablissement: data.containsKey("IDEtablissement")?data["IDEtablissement"]:"",
    //  datatable: data.containsKey("DataTable")?data["DataTable"]:""
    );
  }

////// ENVOIE DES DATAS 
final controller = Get.find<TEtablissementController>();
 Map<String,dynamic> toMap(){
  return{
    "IDMatiere" : iDMatiere,
    "CodeMatiere" : codeMatiere,
    "Matiere" : matiere,
    "Etat" :iDMatiere==null || iDMatiere==0 ? 1 : etat,
    "Coefficient" : coef,
    "DataTable" : datatable,
    "IDEtablissement" : controller.dataEtablissementModel.value.idEtablissement,
  };
}

}

