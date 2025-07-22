// ignore_for_file: public_member_api_docs, sort_constructors_first
class TCycleModel {
  int? iDCycleScolaire;
  String? cycleScolaire;
  String? sousTitre;
  bool?etat;

   TCycleModel({this.iDCycleScolaire,this.cycleScolaire,this.etat,this.sousTitre});

   ///// RECUPERATION
  factory TCycleModel.fromMap(Map<String,dynamic> data){
    return TCycleModel(
      iDCycleScolaire: data.containsKey("IDCycleScolaire")?data["IDCycleScolaire"]:"",
      cycleScolaire: data.containsKey("CycleScolaire")?data["CycleScolaire"]:"",
      sousTitre: data.containsKey("SousTitre")?data["SousTitre"]??'':'',
      etat: data.containsKey("Etat")?data["Etat"]??false:false,
    );
  }


  
////// ENVOIE DES DATAS 

 Map<String,dynamic> toMap(){
  return{
    "IDCycleScolaire" : iDCycleScolaire,
    "CycleScolaire" : cycleScolaire,
    "Etat" : etat,
    "SousTitre" : sousTitre
  };
}
  

  TCycleModel copyWith({TCycleModel? data}) {
    return TCycleModel(
      iDCycleScolaire: data!.iDCycleScolaire,    // iDCycleScolaire ?? this.iDCycleScolaire,
      cycleScolaire: data.cycleScolaire,      // ?? this.cycleScolaire,
      sousTitre: data.sousTitre               //?? this.sousTitre,
    );
  }
}
