class TSerieModel {
  
int? iDSerie;						          
String? serie;
String? libSerie;
String? typeEnseignement;
bool? etat; 
List? dataSerie;
			       

  TSerieModel({this.iDSerie,this.serie,this.libSerie,this.etat,this.typeEnseignement,this.dataSerie });


///// RECUPERATION
  factory TSerieModel.fromMap(Map<String,dynamic> data){
    return TSerieModel(
     iDSerie: data.containsKey("IDSerie")?data["IDSerie"]:"",
     serie: data.containsKey("Serie")?data["Serie"]:"",
     libSerie: data.containsKey("LibSerie")?data["LibSerie"]:"",
     etat: data.containsKey("Etat")?data["Etat"]:"",
     typeEnseignement: data.containsKey("TypeEnseignement")?data["TypeEnseignement"]:"",
    );
  }

////// ENVOIE DES DATAS 

 Map<String,dynamic> toMap(){
  return{
    "IDSerie" : iDSerie,
    "Serie" : serie,
    "Etat" : true,
    "LibSerie" : libSerie,
    "TypeEnseignement" : typeEnseignement,
    "SerieData" : dataSerie,
  };
}

}
