

import 'package:ecole/Modalite_Paiement/Model/modalite_paiement_model.dart';
import 'package:ecole/Niveau%20Serie/Model/niveau_serie_model.dart';

class TScolariteModel {
int? IDScolarite;
int? MontantScolarite;
int? FraisAnnexe;
int? FraisInscription;
int? IDNiveauSerie;
List<TModalitePaiementModel>? DataTable;
List<TNiveauSerieModel>? DataTableNiveauSerie;
TNiveauSerieModel? DataNiveauSerie;

  TScolariteModel({
    this.IDScolarite,
    this.MontantScolarite,
    this.FraisAnnexe,
    this.FraisInscription,
    this.IDNiveauSerie,
    this.DataTable,
    this.DataTableNiveauSerie,
    this.DataNiveauSerie,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'IDScolarite': IDScolarite,
      'MontantScolarite': MontantScolarite,
      'FraisAnnexe': FraisAnnexe,
      'FraisInscription': FraisInscription,
      'IDNiveauSerie': IDNiveauSerie,
      'DataTable': DataTable!.map((x) => x.toMap()).toList(),
      'DataTableNiveauSerie': DataTableNiveauSerie!.map((x) => x.toMap()).toList(),
      'DataNiveauSerie': DataNiveauSerie?.toMap(),
    };
  }

  factory TScolariteModel.fromMap(Map<String, dynamic> map) {
    return TScolariteModel(
      IDScolarite: map['IDScolarite'] != null ? map['IDScolarite'] as int : null,
      MontantScolarite: map['MontantScolarite'] != null ? map['MontantScolarite'] as int : null,
      FraisAnnexe: map['FraisAnnexe'] != null ? map['FraisAnnexe'] as int : null,
      FraisInscription: map['FraisInscription'] != null ? map['FraisInscription'] as int : null,
      IDNiveauSerie: map['IDNiveauSerie'] != null ? map['IDNiveauSerie'] as int : null,
      DataTable: map['DataTable'] != null ? List<TModalitePaiementModel>.from((map['DataTable'] ).map<TModalitePaiementModel?>((x) => TModalitePaiementModel.fromMap(x as Map<String,dynamic>),),) : null,
       DataTableNiveauSerie: map['DataTableNiveauSerie'] != null ? List<TNiveauSerieModel>.from((map['DataTableNiveauSerie']).map<TNiveauSerieModel?>((x) => TNiveauSerieModel.fromMap(x as Map<String,dynamic>),),) : null,
       DataNiveauSerie: map['DataNiveauSerie'] != null ? TNiveauSerieModel.fromMap(map['DataNiveauSerie']) : null,
    );
  }


}
