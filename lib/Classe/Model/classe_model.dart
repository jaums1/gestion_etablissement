import 'package:ecole/Niveau%20Serie/Model/niveau_serie_model.dart';

class TClasseModel {
int? IDClasse;
String? LibClasse;
int? IDEtablissement;
int? IDNiveauSerie;
int? Capacite;
TNiveauSerieModel? DataNiveauSerie;
  TClasseModel({
    this.IDClasse,
    this.LibClasse,
    this.IDEtablissement,
    this.IDNiveauSerie,
    this.Capacite,
    this.DataNiveauSerie,
  });
 


  Map<String, dynamic> toMap() {
    return {
      'IDClasse': IDClasse,
      'LibClasse': LibClasse,
      'IDEtablissement': IDEtablissement,
      'IDNiveauSerie': IDNiveauSerie,
      'Capacite': Capacite,
      'DataNiveauSerie': DataNiveauSerie?.toMap(),
    };
  }

  factory TClasseModel.fromMap(Map<String, dynamic> map) {
    return TClasseModel(
      IDClasse: map['IDClasse'],
      LibClasse: map['LibClasse'],
      IDEtablissement: map['IDEtablissement'],
      IDNiveauSerie: map['IDNiveauSerie'],
      Capacite: map['Capacite'],
      DataNiveauSerie: map['DataNiveauSerie'] != null ? TNiveauSerieModel.fromMap(map['DataNiveauSerie']) : null,
    );
  }

}
