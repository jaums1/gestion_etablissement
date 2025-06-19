class TStatutCustom {
  
  static paiement(montant){
      if(montant==0) return "Solde";
      if(montant !=0) return "Non Solde";
  }
}