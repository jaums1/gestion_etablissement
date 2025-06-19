import 'package:ecole/Configs/cammon/widgets/Data_table/table_action_icon_button.dart';
import 'package:ecole/Configs/cammon/widgets/buttons/button.dart';
import 'package:ecole/Configs/utils/Constant/colors.dart';
import 'package:ecole/Configs/utils/Constant/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../../../Configs/cammon/widgets/containers/rounded_container_create.dart';
import '../../../../../Configs/utils/Device/devices_utility.dart';
import '../../../../../Configs/utils/Popup/showdialogue.dart';
import '../../../../../Niveau Serie/Screen/ShowDialog/dialogue_niveau_serie.dart';
import '../../../../Controller/scolarite_controller.dart';
import '../../../../Controller/scolarite_function.dart';



class TScolariteSelectNiveauSerie extends StatelessWidget {
  const TScolariteSelectNiveauSerie({super.key,this.argument="sus", this.controller});
 final String? argument;
 final TScolariteController? controller;
  @override
  Widget build(BuildContext context) {

    return  Padding(
        padding: const EdgeInsets.only(bottom: TSizes.md),
        child: TRoundedContainerCreate(
             child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 TAffichageNiveauSerie(controller: controller!,),
                   ////// NIVEAU SERIE
                  TSelectionNiveauSerie(controller: controller!,)
               ],
             ),
        ),
    );
  }
}

class TAffichageNiveauSerie extends StatelessWidget {
  const TAffichageNiveauSerie({super.key, required this.controller});
  final TScolariteController controller;
  @override
  Widget build(BuildContext context) {
    final functions= TScolariteFunction();
    print(controller.variable.DataTableNiveauSerie.length);
    return Obx(
     ()=> Padding(
       padding: const EdgeInsets.only(bottom:  10.0),
       child: Wrap(
         alignment:TDeviceUtility.isDesktopScreen(context)? WrapAlignment.start:WrapAlignment.center,
                      runSpacing: 10,
                      spacing: 10,
                      children: controller.variable.DataTableNiveauSerie.map(
        
                        (data)=>  Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(width: 0.5,color: TColors.primary)
                          ),
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Row(
                              children: [
                                Padding(padding: EdgeInsets.only(right: 8,left: 8),
                                child:  Text(data.niveauSerie.toString(),style: Theme.of(context).textTheme.bodyMedium,),
                                ),
                                TTableActionIconButtons(delete: true,onDeletePressed: ()=> functions.H_OnchangeSupprime(data),
                                edit: false,
                                iconSize: 18,
                                )
                              ],
                            ),
                          ),
                        ),
                        ).toList()
                        ),
     ),
    );
  }
}

class TSelectionNiveauSerie extends StatelessWidget {
  
  const TSelectionNiveauSerie({
    super.key,
    required this.controller
  });

  final TScolariteController controller;


  @override
  Widget build(BuildContext context) {
    final functions  = TScolariteFunction();
    return Obx(
      ()=> Align(
       child: Column(
         children: [
      controller.variable.DataTableNiveauSerie.isEmpty? 
         Padding(
             padding: const EdgeInsets.symmetric(vertical:  15.0),
             child: Text("Veuillez ajouter votre niveau d'etude",style: Theme.of(context).textTheme.bodyLarge!.copyWith(
               color: TColors.darkGrey,fontSize: 16
             ),),
           ): SizedBox(),
           SizedBox(
             // width: 5,
           child: TButton.elevatedButton(text:"Ajouter Niveau étude",onPressed:
            ()=>TShowdialogue.showWidget( titre: "Sélectionner les niveaux de série",
            widgets:TDialogueNiveauSerie(onPressed: functions.H_OnchangeNiveauSerie,) )
  
           
            ),
           ),
         
          ],
          ),
         ),
    );
  }
}