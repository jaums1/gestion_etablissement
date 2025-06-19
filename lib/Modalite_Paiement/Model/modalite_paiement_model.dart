

class TModalitePaiementModel {
int? IDModalitePaiement;
int? IDScolarite;
String? LibVersement;
int? Montant;
String? Jour;
String? Mois;
String? JourMois;
String? JourRappel;
String? JourRappelMois;

  TModalitePaiementModel({
    this.IDModalitePaiement,
    this.IDScolarite,
    this.LibVersement,
    this.Montant,
    this.Jour,
    this.Mois,
    this.JourMois,
    this.JourRappel,
    this.JourRappelMois,
  });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'IDModalitePaiement': IDModalitePaiement,
      'IDScolarite': IDScolarite,
      'LibVersement': LibVersement,
      'Montant': Montant,
      'Jour': Jour,
      'Mois': Mois,
      'JourMois': JourMois,
      'JourRappel': JourRappel,
      'JourRappelMois': JourRappelMois,
    };
  }

  factory TModalitePaiementModel.fromMap(Map<String, dynamic> map) {
    return TModalitePaiementModel(
      IDModalitePaiement: map['IDModalitePaiement'] != null ? map['IDModalitePaiement'] as int : null,
      IDScolarite: map['IDScolarite'] != null ? map['IDScolarite'] as int : null,
      LibVersement: map['LibVersement'] != null ? map['LibVersement'] as String : null,
      Montant: map['Montant'] != null ? map['Montant'] as int : null,
      Jour: map['Jour'] != null ? map['Jour'] as String : null,
      Mois: map['Mois'] != null ? map['Mois'] as String : null,
      JourMois: map['JourMois'] != null ? map['JourMois'] as String : null,
      JourRappel: map['JourRappel'] != null ? map['JourRappel'] as String : null,
      JourRappelMois: map['JourRappelMois'] != null ? map['JourRappelMois'] as String : null,
    );
  }

}
