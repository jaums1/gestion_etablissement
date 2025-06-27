import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Constant/sizes.dart';

class TStatutCustom {
  
 Widget H_CardreCouleur({Color? color,String? titre}){
  return Container(
          padding: EdgeInsets.symmetric(horizontal: TSizes.md,vertical: 4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            color: color!.withValues(alpha: 0.1)
          ),
          child: Text(titre.toString(),style: Theme.of(Get.context!).textTheme.bodyMedium!.copyWith(
            color: color,fontSize: 13,fontWeight: FontWeight.w500),overflow: TextOverflow.ellipsis,maxLines: 1,),
        );
 }

  
  Widget H_OnChangeCouleur({String? titre}){
    if(titre=="Actif") return   H_CardreCouleur(titre: titre,color: Colors.lightGreen);
    if(titre=="Suspendu") return   H_CardreCouleur(titre: titre,color: Colors.grey);
    if(titre=="En congé") return   H_CardreCouleur(titre: titre,color: Colors.amber);
    if(titre=="Démissionnaire") return   H_CardreCouleur(titre: titre,color: Colors.redAccent[100]);
    if(titre=="Licencié") return   H_CardreCouleur(titre: titre,color: Colors.red[800]);
    if(titre=="Retraité") return   H_CardreCouleur(titre: titre,color: Colors.blueGrey);
    if(titre=="Décédé") return   H_CardreCouleur(titre: titre,color: Colors.black);
    if(titre!.toLowerCase()=="solde") return   H_CardreCouleur(titre: titre,color: Colors.green);
    if(titre.toLowerCase()=="non solde") return   H_CardreCouleur(titre: titre,color: Colors.red);
    
    return H_CardreCouleur(titre: "Autre",color: Colors.blueAccent);
    
  }
  static paiement(montant){
      if(montant==0) return "Solde";
      if(montant !=0) return "Non Solde";
  }
}