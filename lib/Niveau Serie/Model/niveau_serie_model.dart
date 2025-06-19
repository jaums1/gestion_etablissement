import 'package:ecole/Etablissement/Controller/etablissement_controller.dart';
import 'package:get/get.dart';

import '../../Serie/Model/serie_model.dart';

class TNiveauSerieModel {
 int? iDNiveauSerie;
 String? niveauSerie;
 String? niveau;
 String? typeEnseignement;
 String? serie;
 int? iDEtablissement;
 int? iDSerie;
 int? iDNiveauScolaire;
 List<TSerieModel> dataTable=[];
 

TNiveauSerieModel({this.iDNiveauSerie,this.niveau,this.niveauSerie,this.iDEtablissement,
this.iDNiveauScolaire,this.iDSerie,this.serie,this.typeEnseignement, 
});
  
///// RECUPERATION
  factory TNiveauSerieModel.fromMap(Map<String,dynamic> data){
    return TNiveauSerieModel(
     iDNiveauSerie: data.containsKey("IDNiveauSerie")?data["IDNiveauSerie"]:"",
     iDNiveauScolaire: data.containsKey("IDNiveauScolaire")?data["IDNiveauScolaire"]:"",
     iDSerie: data.containsKey("IDSerie")?data["IDSerie"]:"",
     iDEtablissement: data.containsKey("IDEtablissement")?data["IDEtablissement"]:"",
     niveau: data.containsKey("Niveau")?data["Niveau"]:"",
     serie: data.containsKey("Serie")?data["Serie"]:"",
     niveauSerie: data.containsKey("NiveauSerie")?data["NiveauSerie"]:"",
     typeEnseignement: data.containsKey("TypeEnseignement")?data["TypeEnseignement"]:"",
    );
  }

////// ENVOIE DES DATAS 
final controller = Get.find<TEtablissementController>();
 Map<String,dynamic> toMap(){
  this.dataTable =dataTable;

  // dataTable?.map((e)=>print(e.serie)).toList();
  return{
    "IDNiveauSerie" : iDNiveauSerie,
    "NiveauSerie" : niveauSerie,
    "Niveau" : niveau,
    "Serie" : serie,
    "IDEtablissement" : controller.dataEtablissementModel.value.idEtablissement,
    "IDSerie" : iDSerie,
    "IDNiveauScolaire" : iDNiveauScolaire,
    "TypeEnseignement" : typeEnseignement,
    "DataTable" : this.dataTable,
  };
}

}

