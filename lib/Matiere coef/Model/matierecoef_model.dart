import '../../Niveau Serie/Model/niveau_serie_model.dart';
import 'listematierecoef_model.dart';

class TCoefficientModel {

 TNiveauSerieModel? DataNiveauSerie;
 List<TListeMatiereCoef>? DataTableMatiereCoef;
 TListeMatiereCoef? DataMatiereCoef;
 
  TCoefficientModel({
    this.DataNiveauSerie,
    this.DataTableMatiereCoef,
    this.DataMatiereCoef,
  });





  TCoefficientModel copyWith({
    TNiveauSerieModel? DataNiveauSerie,
    List <TListeMatiereCoef>? DataTableMatiereCoef,
    TListeMatiereCoef? DataMatiereCoef,
  }) {
    return TCoefficientModel(
      DataNiveauSerie: DataNiveauSerie ?? this.DataNiveauSerie,
      DataTableMatiereCoef: DataTableMatiereCoef ?? this.DataTableMatiereCoef,
      DataMatiereCoef: DataMatiereCoef ?? this.DataMatiereCoef,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'DataNiveauSerie': DataNiveauSerie?.toMap(),
      'DataTable': DataTableMatiereCoef==null ?[]: DataTableMatiereCoef!.map((x) => x.toMap()).toList(),
      'Data': DataMatiereCoef?.toMap(),
    };
  }

  factory TCoefficientModel.fromMap(Map<String, dynamic> map) {
    return TCoefficientModel(
      DataNiveauSerie: map['DataNiveauSerie'] != null ? TNiveauSerieModel.fromMap(map['DataNiveauSerie'] as Map<String,dynamic>) : null,
      DataTableMatiereCoef: map['DataTable'] != null ? List<TListeMatiereCoef>.from((map['DataTable'] ).map<TListeMatiereCoef?>((x) => TListeMatiereCoef.fromMap(x as Map<String,dynamic>),),) : null,
      DataMatiereCoef: map['Data'] != null ? TListeMatiereCoef.fromMap(map['Data'] as Map<String,dynamic>) : null,
    );
  }



}



// List<TListeMatiereCoef>.from((map['DataTableMatiereCoef'] as List<int>).map<TListeMatiereCoef?>((x) => TListeMatiereCoef.fromMap(x as Map<String,dynamic>),),) 