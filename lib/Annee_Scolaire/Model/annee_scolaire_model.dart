// ignore_for_file: public_member_api_docs, sort_constructors_first, unnecessary_this

import 'package:ecole/Configs/utils/formatters/formatters.dart';

class TAnneeScolaireModel {
int? IDAnneeScolaire;
int? IDEtablissement;
String? AnneeScolaire;
String?	Statut;
DateTime?	DateDebut;
DateTime? DateFin;

  TAnneeScolaireModel({
    this.IDAnneeScolaire,
    this.IDEtablissement,
    this.AnneeScolaire,
    this.DateFin,
    this.DateDebut,
    this.Statut
  });

  TAnneeScolaireModel copyWith({
    TAnneeScolaireModel? data
  }) {
    return TAnneeScolaireModel(
      IDAnneeScolaire:  data!.IDAnneeScolaire ?? this.IDAnneeScolaire,
      IDEtablissement: data.IDEtablissement ?? this.IDEtablissement,
      AnneeScolaire: data.AnneeScolaire ?? this.AnneeScolaire,
      DateFin: data.DateFin ?? this.DateFin,
      DateDebut: data.DateDebut ?? this.DateDebut,
      Statut: data.Statut ?? this.Statut,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'IDAnneeScolaire': IDAnneeScolaire,
      'IDEtablissement': IDEtablissement,
      'AnneeScolaire': AnneeScolaire,
      'DateFin': TFormatters.formatDate(DateFin),
      'DateDebut': TFormatters.formatDate(DateDebut),
      'Statut':Statut,
    };
  }

  factory TAnneeScolaireModel.fromMap(Map<String, dynamic> map) {
    return TAnneeScolaireModel(
      IDAnneeScolaire: map['IDAnneeScolaire'] != null ? map['IDAnneeScolaire'] as int : null,
      IDEtablissement: map['IDEtablissement'] != null ? map['IDEtablissement'] as int : null,
      AnneeScolaire: map['AnneeScolaire'] != null ? map['AnneeScolaire'] as String : null,
      Statut: map['Statut'] != null ? map['Statut'] as String : null,
      DateFin: map['DateFin'] != null ? DateTime.parse(map['DateFin']) : null,
      DateDebut: map['DateDebut'] != null ? DateTime.parse(map['DateDebut']) : null,
    );
  }

}
