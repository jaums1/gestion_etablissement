		
class TCodeProjetModel {
int? IDCodeProjet;	
String? Type;				
String? Libelle;			
DateTime? DateDebut;			
DateTime? DateFin;			
DateTime? DateCreation;		
int? NbrConnexion;		
String? Code;				
bool? Etat;

  TCodeProjetModel({
    this.IDCodeProjet,
    this.Type,
    this.Libelle,
    this.DateDebut,
    this.DateFin,
    this.DateCreation,
    this.NbrConnexion,
    this.Code,
    this.Etat,
  });

 


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'IDCodeProjet': IDCodeProjet,
      'Type': Type,
      'Libelle': Libelle,
      'DateDebut': DateDebut?.millisecondsSinceEpoch,
      'DateFin': DateFin?.millisecondsSinceEpoch,
      'DateCreation': DateCreation?.millisecondsSinceEpoch,
      'NbrConnexion': NbrConnexion,
      'Code': Code,
      'Etat': Etat,
    };
  }

  factory TCodeProjetModel.fromMap(Map<String, dynamic> map) {
    return TCodeProjetModel(
      IDCodeProjet: map['IDCodeProjet'] != null ? map['IDCodeProjet'] as int : null,
      Type: map['Type'] != null ? map['Type'] as String : null,
      Libelle: map['Libelle'] != null ? map['Libelle'] as String : null,
      DateDebut: map['DateDebut'] != null ? DateTime.parse(map['DateDebut']) : null,
      DateFin: map['DateFin'] != null ? DateTime.parse(map['DateFin']) : null,
      DateCreation: map['DateCreation'] != null ? DateTime.parse(map['DateCreation']) : null,
      NbrConnexion: map['NbrConnexion'] != null ? map['NbrConnexion'] as int : null,
      Code: map['Code'] != null ? map['Code'] as String : null,
      Etat: map['Etat'] != null ? map['Etat'] as bool : null,
    );
  }


}
