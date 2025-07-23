import 'package:ecole/Configs/cammon/widgets/Data_table/table_action_icon_button.dart';
import 'package:ecole/Configs/cammon/widgets/texts/texte_riche.dart';
import 'package:ecole/Coefficient/Controller/matierecoef_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../Configs/cammon/widgets/TitrePage/titlepage.dart';
import '../../Configs/cammon/widgets/buttons/button.dart';
import '../../Configs/cammon/widgets/containers/rounded_container_create.dart';
import '../../Configs/utils/Constant/colors.dart';
import '../../Configs/utils/Constant/sizes.dart';
import '../../Configs/utils/Constant/texte_string.dart';
import '../Controller/coefficient_validation.dart';
import '../Controller/page_coefficient.dart';




class TCoefficientScreen extends StatelessWidget {
  const TCoefficientScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<TCoefficientController>();
    controller.H_RecupeData();
    return Scaffold(
      backgroundColor: TColors.primaryBackground,
      appBar: AppBar(
        title:  TTitlePage(padding:false ,tilte:  TText.matiereCoef),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TRoundedContainerCreate(
          child: Obx(() =>
              ListView.builder(
              itemCount: controller.DataTableFiltreCoefficient.length,
              itemBuilder: (context,index){
                final data = controller.DataTableFiltreCoefficient[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom:  8.0),
                  child: Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color:TColors.lightgrey ,
                      borderRadius: const BorderRadius.all(Radius.circular(4.0), 
                      ),
                  ),
                child: Theme(
                  data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                  child: ExpansionTile(
                    leading: SizedBox(
                      height: 30,
                      width: 30,
                      child: TButton.iconButton(padding: 0,
                            icon: Iconsax.add,size: TSizes.md,
                            onPressed: () => TCoefficientPage().H_PageShowDialogNouveau(id:data.DataNiveauSerie!.iDNiveauSerie ))
                    ),
                    backgroundColor: Colors.transparent,
                    collapsedBackgroundColor: Colors.transparent,
                    title: Text(data.DataNiveauSerie==null?"" : data.DataNiveauSerie!.niveauSerie.toString()),
                   children:data.DataTableMatiereCoef==null? []: data.DataTableMatiereCoef!.map((e){
                    final DataDetail =e;
                    return   Container(
                      width: double.infinity,
                      color: Colors.white,
                      child: ListTile(
                        trailing:Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                           TTableActionIconButtons(iconSize: 20,
                           onDeletePressed: ()=>TCoefficientValidation().H_Supprimer(id:DataDetail.IDAffectationNiveauMatiere)  ,
                           onEditPressed: ()=>TCoefficientPage().H_PageShowDialogModifier(
                            id: DataDetail.IDAffectationNiveauMatiere,IDNiveauSerie:data.DataNiveauSerie!.iDNiveauSerie ),
                           )
                          ],
                        ) ,
                        title:Text(DataDetail.Matiere.toString() ) ,
                        subtitle:TexteRicheCustom.TexteRicheLigne(
                              textPrimaire: DataDetail.Coefficient.toString(),textSecondaire: "Coefficient",
                              colorPrimaire: Colors.red
                            )
                      ),
                    );
                   }).toList()
                  ),
                )
                  ),
                );
              }),
          ),
        ),
      )  
       
    );
    
    
    
  }


}
