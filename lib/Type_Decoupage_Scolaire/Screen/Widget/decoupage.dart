
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Configs/cammon/widgets/Chargement/etat_chargement.dart';
import '../../../Configs/cammon/widgets/TitrePage/titlepage.dart';
import '../../../Configs/cammon/widgets/containers/rounded_container_create.dart';
import '../../../Configs/utils/Constant/colors.dart';
import '../../../Configs/utils/Constant/texte_string.dart';
import '../../Controller/typedecoupage_controller.dart';


class TDecoupageScolaireScreen extends StatelessWidget {
 
  const TDecoupageScolaireScreen({super.key});

  @override
  Widget build(BuildContext context) {
      final controller     = Get.find<TTypeDecoupageController>();
      
    return Scaffold(
      backgroundColor: TColors.primaryBackground,
      appBar: AppBar(
        title: TTitlePage(tilte:TText.decoupageScolaire.tr,),
      ),
      body:Padding(padding: EdgeInsets.all(8),
      child: SizedBox(
        // height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: TRoundedContainerCreate(
            child:Obx( (){
                        // bool select = tab.etat!;
                       if (controller.isLoading.value==false) {
                      return Center(child: CircularProgressIndicator(),);
                         }

                            // État quand les données sont vides
                      if (controller.DataTableTypeDecoupage.isEmpty && controller.isLoading.value==true ) {
                         return TEtatChargement.H_EtatDataVide(onPressedChargement: () => controller.H_RecupeData(),
                         height: double.infinity/3);
                       } 

                      return  SizedBox(
                        child: Column(
                          children: controller.DataTableTypeDecoupage.map((tab){
                         return   RadioListTile<String>(value: tab.libTypeDecoupage??"",  
                                  activeColor: TColors.primary,
                                  title: Text(tab.libTypeDecoupage??""),
                                  subtitle:Text(tab.DataTableDecoupage!.map((e)=> e.libDecoupage).join(', ')) ,
                                  groupValue:   controller.selectRadio.value,
                                  selected:controller.selectRadio.value==tab.libTypeDecoupage?true:false,
                                  onChanged: controller.onSelectRadio);
                          }).toList(),
                        ),
                      );
                      }) ,
            ),
        ),
      ),
      ),
    );
  }
}