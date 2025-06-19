class TNiveauModel {
 int? iDNiveauScolaire;	
 int? iDCycleScolaire;					          
String? niveau;
String? typeNiveau;
bool? etat; 
List<String>? niveauData=[];
// var jue;
				       

  TNiveauModel({this.iDNiveauScolaire,this.iDCycleScolaire,this.niveau,this.etat,this.niveauData,this.typeNiveau });


///// RECUPERATION
  factory TNiveauModel.fromMap(Map<String,dynamic> data){
    return TNiveauModel(
     iDNiveauScolaire: data.containsKey("IDNiveauScolaire")?data["IDNiveauScolaire"]:"",
     iDCycleScolaire: data.containsKey("IDCycleScolaire")?data["IDCycleScolaire"]:"",
     niveau: data.containsKey("Niveau")?data["Niveau"]:"",
     etat: data.containsKey("Etat")?data["Etat"]:"",
     typeNiveau: data.containsKey("TypeNiveau")?data["TypeNiveau"]:"",
      // dateCreation: data.containsKey("DateCreation")?data["DateCreation"]??'':'',
    );
  }

////// ENVOIE DES DATAS 

 Map<String,dynamic> toMap(){
  return{
    "IDNiveauScolaire" : iDNiveauScolaire,
    "IDCycleScolaire" : iDCycleScolaire,
    "Niveau" : niveau,
    "Etat" : true,
    "NiveauData" : niveauData,
    "TypeNiveau" : typeNiveau,
  };
}
}
