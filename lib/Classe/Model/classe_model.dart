import 'package:ecole/Etablissement/Controller/etablissement_controller.dart';
import 'package:ecole/Niveau%20Serie/Model/niveau_serie_model.dart';
import 'package:get/get.dart';

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
 
final controller =Get.find<TEtablissementController>();

  Map<String, dynamic> toMap() {
    return {
      'IDClasse': IDClasse,
      'LibClasse': LibClasse,
      'IDEtablissement': controller.DataEtablissement.value.idEtablissement,
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
