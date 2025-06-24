import '../../Configs/utils/Constant/image_string.dart';
import '../../Configs/utils/formatters/formatters.dart';

class TEtablissementModel {
final int? idEtablissement;	
String? nom;					          
String? codeEtatblissement;
String? typeEtablissement; 
String? typeEnseignement; 
String? ville;				         
String? pays;	
String? email;					        
String? adresse;			        
String? telephone;			      
String? siteWeb;				       
DateTime? dateCreation;			   
String? logo;				          
String? nomDirecteur;			   
String? statutActivation;		
bool? etatActivation;		  
DateTime? dateDebut; 			     
DateTime? dateFin;				       

  TEtablissementModel({this.idEtablissement,this.nom,this.codeEtatblissement,this.typeEtablissement,
  this.ville,this.pays,this.email,this.adresse,this.telephone,this.siteWeb,this.dateCreation,
  this.logo,this.nomDirecteur,this.etatActivation,this.dateDebut,this.statutActivation,this.dateFin,
  this.typeEnseignement
  });



///// RECUPERATION
  factory TEtablissementModel.fromMap(Map<String,dynamic> data){
    return TEtablissementModel(
      idEtablissement: data.containsKey("IDEtablissement")?data["IDEtablissement"]:0,
      nom: data.containsKey("NomEtablissement")?data["NomEtablissement"]:"",
      codeEtatblissement: data.containsKey("CodeEtatblissement")?data["CodeEtatblissement"]:"",
      typeEtablissement: data.containsKey("TypeEtablissement")?data["TypeEtablissement"]:"",
      typeEnseignement: data.containsKey("TypeEnseignement")?data["TypeEnseignement"]:"",
      ville: data.containsKey("Ville")?data["Ville"]:"",
      pays: data.containsKey("Pays")?data["Pays"]:"",
      adresse: data.containsKey("Adresse")?data["Adresse"]:"",
      telephone: data.containsKey("Telephone")?data["Telephone"]:"",
      email: data.containsKey("Email")?data["Email"]:"",
      siteWeb: data.containsKey("SiteWeb")?data["SiteWeb"]:"",
      logo: data.containsKey("Logo")?data["Logo"]:"",
      nomDirecteur: data.containsKey("NomDirecteur")?data["NomDirecteur"]:"",
      statutActivation: data.containsKey("StatutActivation")?data["StatutActivation"]:"",
      etatActivation: data.containsKey("EtatActivation")?data["EtatActivation"]:true,
    );
  }

////// ENVOIE DES DATAS 

 Map<String,dynamic> toMap(){
  return{
    "IDEtablissement" : idEtablissement,
    "NomEtablissement" : nom,
    "CodeEtatblissement" : codeEtatblissement,
    "TypeEtablissement" : typeEtablissement,
    "TypeEnseignement" : typeEnseignement,
    "Ville": ville,
    "Pays": pays,
    "Adresse": adresse,
    "Telephone": telephone,
    "Email": email,
    "SiteWeb": siteWeb,
    "DateCreation":TFormatters.formatDate(DateTime.now()),
    "Logo": logo,
    "NomDirecteur": nomDirecteur,
    "StatutActivation": statutActivation,
    "EtatActivation": etatActivation??true,
    "DateDebut": TFormatters.formatDate(DateTime.now()),
    "DateFin": TFormatters.formatDate(DateTime.now()),
  };
}
}
