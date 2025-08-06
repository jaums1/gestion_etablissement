import 'package:ecole/Configs/cammon/widgets/buttons/button.dart';
import 'package:ecole/Configs/utils/Constant/colors.dart';
import 'package:ecole/Configs/utils/Constant/sizes.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../../../Configs/cammon/widgets/Data_table/table_action_icon_button.dart';
import '../../../../../Configs/cammon/widgets/containers/rounded_container_create.dart';
import '../../../../../Configs/utils/formatters/formatters.dart';
import '../../../../../Modalite_Paiement/Controller/modalite_paiement_controller.dart';
import '../../../../../Modalite_Paiement/Controller/modalite_paiement_page.dart';
import '../../../../../Modalite_Paiement/Controller/modalite_paiement_validation.dart';
import '../../../../Controller/scolarite_controller.dart';



class TScolariteEchelonVersement extends StatelessWidget {
 
 const TScolariteEchelonVersement({super.key,this.argument="sus",this.alignment = WrapAlignment.start, this.controller});
  final WrapAlignment? alignment;
 final String? argument;
  final TScolariteController? controller;
  @override
  Widget build(BuildContext context) {
    final controllerMP = Get.find<TModalitePaiementController>(); 
    
    return   Obx(
      ()=> Padding(
        padding: const EdgeInsets.only(bottom: TSizes.sm),
        child: TRoundedContainerCreate(
             child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
               children: [
                 Wrap(
                    runSpacing: 20,
                    spacing: 20,
                    children: controllerMP.DataTableModalitePaiement.map(
                      (data)=>  Container(
                        width: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          // color: TColors.softGrey.withValues(alpha: 0.8),
                          color: TColors.white,
                          boxShadow: [
                            BoxShadow(
                          color: TColors.grey,
                         spreadRadius:2,
                          blurRadius:1,
                          offset: Offset(0, 2))
                          ]
                        ),
                        child: ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: Padding(
                            padding: const EdgeInsets.symmetric(vertical:  4.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left:  12.0),
                                  child: Text(data.LibVersement.toString(),style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontWeight: FontWeight.w700
                                  ),),
                                ),
                               TTableActionIconButtons(iconSize: 20,
                               onEditPressed: ()=>TModalitePaiementPage().H_PageModifier(param: data.LibVersement),
                               onDeletePressed: ()=>TModalitePaiementValidation().H_Supprimer(param: data.LibVersement),
                               )
                               
                               
                              ],
                            ),
                          ),
                          onTap: (){},
                          subtitle: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                               Expanded(
                                 child: Padding(
                                   padding: const EdgeInsets.only(left:  12.0),
                                   child: Text(TFormatters.formatCurrency(data.Montant),style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: Colors.deepOrange,fontWeight: FontWeight.w600
                                                               ),),
                                 ),
                               ),
                   
                              Expanded(
                                child: Tooltip(
                                  message:"Date : ${data.JourMois} ${DateTime.now().year}" ,
                                  child: Text("Date : ${data.JourMois} ${DateTime.now().year}",style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontWeight: FontWeight.w600
                                  ),maxLines: 1, overflow: TextOverflow.ellipsis,),
                                ),
                              ),
                        
                            ],
                          ),
                        
                        ),
                      )
                      ).toList()
                       
                      ,
                 ),
                   ////// VERSEMENT    
                     Align(
                      child: Column(
                        children: [
              controllerMP.DataTableModalitePaiement.isEmpty?
                         Padding(
                            padding: const EdgeInsets.symmetric(vertical:  15.0),
                            child: Text("Veuillez cliquer sur le bouton pour definir votre modalité",style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: TColors.darkGrey,fontSize: 16
                            ),textAlign: TextAlign.center,),
                          ):SizedBox(height: 20,),
      
                          SizedBox(
                          child: TButton.textButton(text:"Definir votre modalité",
                          onPressed: ()=>TModalitePaiementPage().H_PageNouveau() ),
                          ),
                         ],
                         ),
                        )
               ],
             ),
        ),
      ),
    );
  }
}