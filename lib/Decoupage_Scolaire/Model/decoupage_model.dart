class TDecoupageModel {
  final int? iDDecoupage;
  String? libDecoupage;
  double? coefficient;


  TDecoupageModel({this.iDDecoupage,this.libDecoupage,this.coefficient});

   ///// RECUPERATION
  factory TDecoupageModel.fromMap(Map<String,dynamic> data){
    return TDecoupageModel(
      iDDecoupage: data.containsKey("IDDecoupage")?data["IDDecoupage"]:"",
      libDecoupage: data.containsKey("Decoupage")?data["Decoupage"]:"",
      coefficient: data.containsKey("Coefficient")?data["Coefficient"]??'':'',
    );
  }

  ////// ENVOIE DES DATAS 

 Map<String,dynamic> toMap(){
  return{
    "IDDecoupage" : iDDecoupage,
    "Decoupage" : libDecoupage,
    "Coefficient" : coefficient,
 
  };
}
  
}
