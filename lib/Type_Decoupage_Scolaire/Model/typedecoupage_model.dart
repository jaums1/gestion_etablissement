import '../../Decoupage_Scolaire/Model/decoupage_model.dart';

class TTypeDecoupageModel {
  int? iDTypeDecoupage;
  String? libTypeDecoupage;
  bool? etat;
  int? nbrDecoupage;
  String? sousTitre;
  String? typeDecoupage;
  int? iDEtablissement;
  late final List<TDecoupageModel>? decoupage;

  TTypeDecoupageModel({this.iDTypeDecoupage, this.sousTitre, this.libTypeDecoupage, this.nbrDecoupage, this.decoupage, this.etat, this.typeDecoupage, this.iDEtablissement});

  ///// RECUPERATION
  factory TTypeDecoupageModel.fromMap(Map<String, dynamic> data) {
    return TTypeDecoupageModel(
      iDTypeDecoupage: data.containsKey("IDTypeDecoupage") ? data["IDTypeDecoupage"] : "",
      typeDecoupage: data.containsKey("TypeDecoupage") ? data["TypeDecoupage"] : "",
      iDEtablissement: data.containsKey("IDEtablissement") ? data["IDEtablissement"] : "",
      // decoupage:data['DecoupageScolaire'].map((datas)=>print(TDecoupageModel.fromMap(datas))).toList() // List<TDecoupageModel>.from(data['DecoupageScolaire']),
    );
  }

  ////// ENVOIE DES DATAS 

  Map<String, dynamic> toMap() {
    return {
      "IDTypeDecoupage": iDTypeDecoupage,
      "TypeDecoupage": typeDecoupage,
      "IDEtablissement": iDEtablissement,
    };
  }
}