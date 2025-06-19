
import 'package:ecole/Configs/cammon/widgets/formulaire/form.dart';
import 'package:ecole/Matiere%20coef/Controller/coefficient_matiere.dart';
import 'package:ecole/Matiere%20coef/Controller/flitre_coefficient.dart';
import 'package:ecole/Matiere/Controller/validation_matiere.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Configs/utils/Constant/colors.dart';
import '../../Controller/matierecoef_controller.dart';


class TListeMatiereNonSelectionner extends StatelessWidget {
  const TListeMatiereNonSelectionner({super.key});

  @override
  Widget build(BuildContext context) {
    final formulaire = TFormulaire();
        final controllerCoef = Get.find<TCoefficientController>();
    return Obx(
      ()=> SizedBox(
              height: MediaQuery.of(context).size.height * 0.65,
               child: Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(2))
                ),
                elevation: 1,
                 child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical:  8.0,horizontal: 15),
                      child: Row(
                        children: [
                          Expanded(flex: 7,
                            child: formulaire.textFormField(label: "Recherche",isPadding: true,
                            onChanged:(value)=> TFiltreCoefficient().H_FiltreElement(param: value)
                            )
                          ),
                           SizedBox(width: 20,),
                          Expanded(child:
                          SizedBox(
                            height: 30,
                            child: IconButton(tooltip: "Ajouter",onPressed: ()=>TEnregistrerMatiere().H_OnSelect(), icon: Icon(Icons.add,color: Colors.white,),
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.zero,
                              backgroundColor: Colors.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(4))
                              )
                            ),
                            ),
                          )
                          )
                        ],
                      ),
                    ),
                  ),
                  Divider(thickness: 0.4,),
                  Padding(
                    padding: const EdgeInsets.only(left:  8.0,bottom: 8),
                    child: Text("Liste des Matières",style: Theme.of(context).textTheme.headlineSmall,),
                  ),
                  Expanded(child: ListView.builder(
                    itemCount: controllerCoef.dataTableFiltreMatiere.length,
                    itemBuilder: (context,index){
                     final data = controllerCoef.dataTableFiltreMatiere[index]; 
                    return InkWell(
                      onDoubleTap: ()=> TValidationCoefficient().H_OnSelect(param:data.matiere ),
                      child: ListTile(
                        onTap: (){},
                        title: Row(
                        children: [
                          Expanded(
                           flex: 7,
                            child: Text(data.matiere!,style: Theme.of(context).textTheme.bodyMedium,)),
                          Expanded(
                           flex: 1,
                            child:IconButton(onPressed: ()=>TModifierMatiere().H_OnSelect(param: data.iDMatiere.toString()), icon: Icon(Icons.edit,size: 20,color: TColors.primary,)),
                          )
                        ],
                      ),),
                    );
                  }),), 
                  ],
                             ),
               ),
             ),
    );
  }
}