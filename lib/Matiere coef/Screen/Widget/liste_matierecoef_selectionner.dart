
import 'package:ecole/Configs/utils/Popup/showdialogue.dart';
import 'package:ecole/Matiere%20coef/Controller/coefficient_matiere.dart';
import 'package:ecole/Matiere%20coef/Controller/matierecoef_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Configs/cammon/widgets/combo/combo.dart';
import '../../Controller/coefficient_niveauserie.dart';

class TListeMatiereCoefSelectionner extends StatelessWidget {
  const TListeMatiereCoefSelectionner({super.key});

  @override
  Widget build(BuildContext context) {
    final controllerCoef = Get.find<TCoefficientController>();
    TCoefficientNiveauSerie().H_RecupeData();
    return Obx(
      ()=> Padding(
        padding: const EdgeInsets.only(left:8.0,top: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           ////// NIVEAU 
           Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey,width:0.5 ),
              borderRadius: BorderRadius.all(Radius.circular(8))
            ),
            child: Padding(padding: EdgeInsets.all(10),
            child: TCombo().comboTextChevale(label: "Niveau Serie ",hintText:"Veuillez sélectionner un niveau" ,
             sections: controllerCoef.isSelectNiveauSerie,onChanged:(valeur)=>TCoefficientNiveauSerie().H_onSelectData(param: valeur) //controller.selectNiveau(valeur)
             ),
            ) ,
           ),
          SizedBox(height: 10,),
          Text("Liste des matières sélectionner",style: Theme.of(context).textTheme.headlineSmall,),
          SizedBox(height: 10,),
           Wrap(
            // spacing: 8,
            // runSpacing: 2,
            children: controllerCoef.dataTableMatiere.map(
              (e)=> ListTile(
                onTap: () => TModificationCoefficient().H_OnSelect(param: e.matiere) ,
                trailing: IconButton(onPressed: ()=>TShowdialogue().showQuestion(
                  titre: "SUPPRIMER",message: "Voulez vous vraiment suppmer ${e.matiere}",
                  onPressedValide: ()=>TSupprimerCoefficient().H_Supprimer(param:e.matiere ) 
                ),icon: Icon(Icons.close),color: Colors.red,),
                contentPadding: EdgeInsets.zero,
                subtitle: RichText(
                  textAlign:TextAlign.start ,
                  text: TextSpan(
                  children: [
                    
                    TextSpan(text:"Coefficient : ",style: Theme.of(context).textTheme.bodyMedium),
                    TextSpan(text:e.coef.toString(),style: Theme.of(context).textTheme.bodyMedium!.apply(
                    color: Colors.red
                  ))
                  ] 
                )),
                
                title: Row(
                  children: [
                    Icon(Icons.circle,color: Colors.blue,size: 8,),
                    SizedBox(width: 8,),
                     Expanded(flex: 6,
                      child: Text(e.matiere ==""?"":e.matiere!,style: Theme.of(context).textTheme.bodyMedium,)),
                  ],
                ),
              ) 









              //   Row(
              //     children: [
              //         Icon(Icons.circle,color: Colors.blue,size: 8,),
              //         SizedBox(width: 5,),
              //         Expanded(
              //         flex: 4,
              //         child: Text(e.matiere ==""?"":e.matiere!,style: Theme.of(context).textTheme.bodyMedium,)),
              //         SizedBox(width: 5,),
              //         Expanded(
              //         flex: 3,
              //          child: SizedBox(
              //           child: Row(
              //             children: [
              //               Expanded(child: Text("Coef : ")),
              //               SizedBox(width: 4,),
              //            Expanded(
              //              child: SizedBox(
              //                width: 50,
              //               height: 32,
              //              child: TFormulaire().textFormField(
              //               // textEditingController: e.coef,
              //                 isPadding: true,onChanged: (value)=>controllerCoef.affectationCoef(e.matiere, value )
                              
              //                 )),
              //            ),
              //            SizedBox(width: 5,),
              //            Expanded(child: IconButton(onPressed: ()=>controllerCoef.supprimeMatiere(e.matiere),icon: Icon(Icons.close),color: Colors.red,)),
              //             ],
              //           ),
              //          ),
              //        )
              //         ],
              //   // )
                
              //   // ,
              // ),
              
              
              // TextButton.icon(onPressed: null, 
              // label: Text(e.matiere!,style: Theme.of(context).textTheme.bodyMedium,),
              // icon:Icon(Icons.circle,color: Colors.blue,size: 8,) ,
              // )
              
              
              ).toList(),
           )
          ],
        ),
      ),
    );
  }
}