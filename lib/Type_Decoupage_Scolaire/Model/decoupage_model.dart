// ignore_for_file: public_member_api_docs, sort_constructors_first
class TDecoupageModel {
  int? IDDecoupage;
  String? libDecoupage;
  int? coefficient;


  TDecoupageModel({
    this.IDDecoupage,
    this.libDecoupage,
    this.coefficient,
  });

   ///// RECUPERATION
  factory TDecoupageModel.fromMap(Map<String,dynamic> data){
    return TDecoupageModel(
      IDDecoupage: data.containsKey("IDDecoupage")?data["IDDecoupage"]:0,
      libDecoupage: data.containsKey("DecoupageScolaire")?data["DecoupageScolaire"]:null,
      coefficient: data.containsKey("Coefficient")?data["Coefficient"]??'':null,
    );
  }

  ////// ENVOIE DES DATAS 

 Map<String,dynamic> toMap(){
  return{
    "IDDecoupage" : IDDecoupage,
    "DecoupageScolaire" : libDecoupage,
    "Coefficient" : coefficient,
 
  };
}
  
}
