// ignore_for_file: public_member_api_docs, sort_constructors_first, unnecessary_this


class TListeMatiereCoef {
int?  IDAffectationNiveauMatiere;
int? IDMatiere;
int? IDNiveauSerie;
String? Matiere;
String? TypeEnseignement;
int? Coefficient;

  TListeMatiereCoef({
    this.IDAffectationNiveauMatiere,
    this.IDMatiere,
    this.Matiere,
    this.TypeEnseignement,
    this.Coefficient,
    this.IDNiveauSerie,
  });


  TListeMatiereCoef copyWith({TListeMatiereCoef? data}) {
    return TListeMatiereCoef(
      IDAffectationNiveauMatiere: data!.IDAffectationNiveauMatiere ?? this.IDAffectationNiveauMatiere,
      IDMatiere: data.IDMatiere ?? this.IDMatiere,
      Matiere: data.Matiere ?? this.Matiere,
      TypeEnseignement: data.TypeEnseignement ?? this.TypeEnseignement,
      Coefficient: data.Coefficient ?? this.Coefficient,
      IDNiveauSerie: data.IDNiveauSerie ?? this.IDNiveauSerie,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'IDAffectationNiveauMatiere': IDAffectationNiveauMatiere,
      'IDMatiere': IDMatiere,
      'Matiere': Matiere,
      'TypeEnseignement': TypeEnseignement,
      'Coefficient': Coefficient,
      'IDNiveauSerie': IDNiveauSerie,
    };
  }

  factory TListeMatiereCoef.fromMap(Map<String, dynamic> map) {
    return TListeMatiereCoef(
      IDAffectationNiveauMatiere: map['IDAffectationNiveauMatiere'] != null ? map['IDAffectationNiveauMatiere'] as int : null,
      IDMatiere: map['IDMatiere'] != null ? map['IDMatiere'] as int : null,
      IDNiveauSerie: map['IDNiveauSerie'] != null ? map['IDNiveauSerie'] as int : null,
      Matiere: map['Matiere'] != null ? map['Matiere'] as String : null,
      TypeEnseignement: map['TypeEnseignement'] != null ? map['TypeEnseignement'] as String : null,
      Coefficient: map['Coefficient'] != null ? map['Coefficient'] as int : null,
    );
  }


}
