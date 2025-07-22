import 'package:get/get.dart';

import '../../Configs/utils/Implements/controller_data.dart';
import '../../Configs/utils/dio/dio_client.dart';
import '../../Configs/utils/endpoint/endpoint.dart';
import '../../Niveau Serie/Controller/niveau_serie_controller.dart';
import '../Model/codeProjet_model.dart';



class TCodeProjetController extends GetxController with TControllerData{
   static TCodeProjetController get instance => Get.find();

  ///// DECLARATION DE VARIABLE 
  final DataCodeProjet = TCodeProjetModel().obs;
  final DataTableCodeProjet = RxList<TCodeProjetModel>([]);
  final DataTableFiltreCodeProjet = RxList<TCodeProjetModel>([]);

  final controllerNiveauSerie    = Get.find<TNiveauSerieController>();
  
  final client = TDioHelper(baseUrl:"http://localhost/" );

  //////TRAITEMENT
 
@override
  void H_RecupeData({String? param}) async {
    final reponse = await client.get<TCodeProjetModel>(
      "${TEndpoint.linkCodeProjet}${param==""?"":"/$param"}",
      fromJson: (data) =>TCodeProjetModel.fromMap(data));
      print(reponse.message);
    if(reponse.success)DataCodeProjet.value = reponse.data!; 
  }

@override
  H_Modifier({param}) async {
    
   final reponse = await client.patch(TEndpoint.linkCodeProjet,
   fromJson: (data) =>TCodeProjetModel.fromMap(data));
   print(reponse.message);
    if(reponse.success){
    DataCodeProjet.value = reponse.data!;
    
    }
  }


  @override
  void H_Initialise() {
    DataCodeProjet.value = TCodeProjetModel();
  }
  

  }