import 'package:ecole/Etablissement/Controller/etablissement_controller.dart';
import 'package:get/get.dart';

class TMatiereModel {
 int? iDMatiere;
 String? codeMatiere;
 String? matiere;
 bool? etat;
 double? coef;
 List <TMatiereModel>? DatatableMa;
 


TMatiereModel({this.iDMatiere,this.codeMatiere,this.matiere,this.etat,this.DatatableMa,this.coef});
  
///// RECUPERATION
  factory TMatiereModel.fromMap(Map<String,dynamic> data){
    return TMatiereModel(
     iDMatiere: data.containsKey("IDMatiere")?data["IDMatiere"]:null,
     codeMatiere: data.containsKey("CodeMatiere")?data["CodeMatiere"]:"",
     matiere: data.containsKey("Matiere")?data["Matiere"]:"",
     etat: data.containsKey("Etat")?data["Etat"]:"",
    );
  }

////// ENVOIE DES DATAS 
final controller = Get.find<TEtablissementController>();
 Map<String,dynamic> toMap(){
  return{
    "IDMatiere" : iDMatiere,
    "CodeMatiere" : codeMatiere,
    "Matiere" : matiere,
    "Etat" :etat,
    "DataTable" :DatatableMa==null?[]: DatatableMa!.map((x)=> x.toMap()).toList(),
  };
}

}

