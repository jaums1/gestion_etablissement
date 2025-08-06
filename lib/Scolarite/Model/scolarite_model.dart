

import 'package:ecole/Modalite_Paiement/Model/modalite_paiement_model.dart';
import '../../Niveau_Scolaire/Model/niveauscolaire_model.dart';

class TScolariteModel {
int? IDScolarite;
int? MontantScolarite;
int? FraisAnnexe;
int? FraisInscription;
int? IDNiveauScolaire;
String? TypeScolarite;
List<TModalitePaiementModel>? DataTable;
List<TNiveauModel>? DataTableNiveauScolaire;
TNiveauModel? DataNiveauScolaire;

  TScolariteModel({
    this.IDScolarite,
    this.MontantScolarite,
    this.FraisAnnexe,
    this.FraisInscription,
    this.DataTable,
    this.DataTableNiveauScolaire,
    this.IDNiveauScolaire,
    this.DataNiveauScolaire,
    this.TypeScolarite
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'IDScolarite': IDScolarite,
      'MontantScolarite': MontantScolarite,
      'FraisAnnexe': FraisAnnexe,
      'FraisInscription': FraisInscription,
      'IDNiveauScolaire': IDNiveauScolaire,
      'TypeScolarite': TypeScolarite,
      'DataTable': DataTable!.map((x) => x.toMap()).toList(),
      // 'DataNiveauScolaire': DataNiveauScolaire!.toMap(),
      'DataTableNiveauScolaire': DataTableNiveauScolaire!.map((x) => x.toMap()).toList(),
    };
  }

  factory TScolariteModel.fromMap(Map<String, dynamic> map) {
    return TScolariteModel(
      IDScolarite: map['IDScolarite'] != null ? map['IDScolarite'] as int : null,
      MontantScolarite: map['MontantScolarite'] != null ? map['MontantScolarite'] as int : null,
      FraisAnnexe: map['FraisAnnexe'] != null ? map['FraisAnnexe'] as int : null,
      FraisInscription: map['FraisInscription'] != null ? map['FraisInscription'] as int : null,
      IDNiveauScolaire: map['IDNiveauScolaire'] != null ? map['IDNiveauScolaire'] as int : null,
      TypeScolarite: map['TypeScolarite'] != null ? map['TypeScolarite'] as String : null,
      DataTable: map['DataTable'] != null ? List<TModalitePaiementModel>.from((map['DataTable'] ).map<TModalitePaiementModel?>((x) => TModalitePaiementModel.fromMap(x as Map<String,dynamic>),),) : null,
      //  DataTableNiveauSerie: map['DataTableNiveauSerie'] != null ? List<TNiveauSerieModel>.from((map['DataTableNiveauSerie']).map<TNiveauSerieModel?>((x) => TNiveauSerieModel.fromMap(x as Map<String,dynamic>),),) : null,
     DataNiveauScolaire: map['DataNiveauScolaire'] != null ? TNiveauModel.fromMap(map['DataNiveauScolaire']) : null,
    );
  }


}
