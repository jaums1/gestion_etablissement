import 'package:ecole/Etablissement/Controller/etablissement_controller.dart';
import 'package:get/get.dart';

import '../../Matiere/Model/matiere_model.dart';



class TCoefficientModel {
 int? iDCoefficient;
 int? iDMatiere;
 int? iDNiveauSerie;
 int? iDNiveauScolaire;
 int? IDEtablissement;
 String? matiere;
 String? niveau;
 String? niveauSerie;
 String? typeEnseignement;
 double? coefficient;
 List <TMatiereModel>?datatableMatiere;
 List<String>? lisMatiere;
  //  var datatable;


TCoefficientModel({this.iDMatiere,this.iDCoefficient,this.iDNiveauSerie,this.IDEtablissement,this.typeEnseignement,
this.coefficient,this.matiere,this.niveau,this.datatableMatiere,this.niveauSerie,this.iDNiveauScolaire,this.lisMatiere
// this.datatable
});

///// RECUPERATION
  factory TCoefficientModel.fromMap(Map<String,dynamic> data){
  
  List datasMatiere =data["DataTable"];
  final datatableMatieres =datasMatiere.map((e)=> TMatiereModel.fromMap(e) ).toList();
    return TCoefficientModel(
     iDCoefficient: data.containsKey("IDAffectationMatiereNiveau")?data["IDAffectationMatiereNiveau"]:0,
     IDEtablissement: data.containsKey("IDEtablissement")?data["IDEtablissement"]:0,
     iDNiveauSerie: data.containsKey("IDNiveauSerie")?data["IDNiveauSerie"]:0,
     iDNiveauScolaire: data.containsKey("IDNiveau")?data["IDNiveau"]:0,
     niveau: data.containsKey("Niveau")?data["Niveau"]:"",
     niveauSerie: data.containsKey("NiveauSerie")?data["NiveauSerie"]:"",
     matiere: data.containsKey("Matiere")?data["Matiere"]:"",
     coefficient: data.containsKey("Coefficient")?double.parse(data["Coefficient"].toString()):0.0,
     typeEnseignement: data.containsKey("TypeEnseignement")?data["TypeEnseignement"]:"",
     datatableMatiere: data.containsKey("DataTable")? datasMatiere.map((e)=> TMatiereModel.fromMap(e) ).toList()  :[],
     lisMatiere: datatableMatieres.where((f)=>f.etat==true).map((e)=> e.matiere.toString()).toList()
    //  map((e)=> e.matiere).toList()
    );
  }

////// ENVOIE DES DATAS 
final controller = Get.find<TEtablissementController>();
 Map<String,dynamic> toMap(){
  return{
    "IDAffectationMatiereNiveau" : iDCoefficient,
    "IDEtablissement" : controller.dataEtablissementModel.value.idEtablissement,
    "IDNiveauSerie" : iDNiveauSerie,
    "Niveau" : niveau,
    "NiveauSerie" : niveauSerie,
    "IDMatiere" : iDMatiere,
    "Matiere" : matiere,
    "TypeEnseignement" : typeEnseignement,
    "Coefficient" : coefficient,
    "IDNiveau" : iDNiveauScolaire,
    "DataTable" : datatableMatiere,
  };
}

}
