// ignore_for_file: public_member_api_docs, sort_constructors_first, unnecessary_this

import 'decoupage_model.dart';

class TTypeDecoupageModel {
  int? iDTypeDecoupage;
  String? libTypeDecoupage;
  bool? etat;
  int? nbrDecoupage;
  String? sousTitre;
  String? typeDecoupage;
  int? iDEtablissement;
  List<TDecoupageModel>? DataTableDecoupage;

  TTypeDecoupageModel({
    this.iDTypeDecoupage,
    this.libTypeDecoupage,
    this.etat,
    this.nbrDecoupage,
    this.sousTitre,
    this.typeDecoupage,
    this.iDEtablissement,
    this.DataTableDecoupage,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'IDTypeDecoupage': iDTypeDecoupage,
      'LibTypeDecoupage': libTypeDecoupage,
      'Etat': etat,
      'NbrDecoupage': nbrDecoupage,
      'SousTitre': sousTitre,
      'TypeDecoupage': typeDecoupage,
      'IDEtablissement': iDEtablissement,
    };
  }

  factory TTypeDecoupageModel.fromMap(Map<String, dynamic> map) {
    return TTypeDecoupageModel(
      iDTypeDecoupage: map['IDTypeDecoupage'] != null ? map['IDTypeDecoupage'] as int : null,
      libTypeDecoupage: map['LibTypeDecoupage'] != null ? map['LibTypeDecoupage'] as String : null,
      etat: map['Etat'] != null ? map['Etat'] as bool : null,
      nbrDecoupage: map['NbrDecoupage'] != null ? map['NbrDecoupage'] as int : null,
      typeDecoupage: map['TypeDecoupage'] != null ? map['TypeDecoupage'] as String : null,
      iDEtablissement: map['IDEtablissement'] != null ? map['IDEtablissement'] as int : null,
      DataTableDecoupage: map['DataTableDecoupage'] != null ? List<TDecoupageModel>.from((map['DataTableDecoupage']).map<TDecoupageModel?>((x) => TDecoupageModel.fromMap(x as Map<String,dynamic>),),) : null,
      
    );
  }


  TTypeDecoupageModel copyWith({
    TTypeDecoupageModel? Data
  }) {
    return TTypeDecoupageModel(
      iDTypeDecoupage: Data!.iDTypeDecoupage ?? iDTypeDecoupage,
      libTypeDecoupage: Data.libTypeDecoupage ?? this.libTypeDecoupage,
      etat: Data.etat ?? this.etat,
      nbrDecoupage: Data.nbrDecoupage ?? this.nbrDecoupage,
      sousTitre: Data.sousTitre ?? this.sousTitre,
      typeDecoupage: Data.typeDecoupage ?? this.typeDecoupage,
      iDEtablissement: Data.iDEtablissement ?? this.iDEtablissement,
      DataTableDecoupage: Data.DataTableDecoupage ?? this.DataTableDecoupage,
    );
  }
}
