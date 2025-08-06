import 'package:ecole/Eleves/Model/eleve_model.dart';
import 'package:get/get.dart';
import '../../Classe/Controller/classe_controller.dart';
import '../../Configs/utils/Dates/showdata.dart';
import '../../Configs/utils/Implements/function_data.dart';
import '../../Configs/utils/Popup/loaders.dart';
import '../../Configs/utils/formatters/formatters.dart';
import '../../Eleves/Controller/eleve_controller.dart';
import '../../Scolarite/Controller/scolarite_controller.dart';
import 'inscription_controller.dart';
import 'inscription_validation.dart';

class TInscriptionFunction with TFunctionData {
  final controller = Get.find<TInscriptionController>();
   final controllerScolrite = Get.find<TScolariteController>();
   final ControllerClasse = Get.find<TClasseController>();
   final ControllerEleve = Get.find<TEleveController>();
  // final controller = Get.find<TInscriptionController>();
   
   H_ValidationInscription()async{
    final result = controller.variable.keyInscription.currentState!.validate();
      final int scolarite= int.parse(controller.variable.Scolarite.text==""?0.toString(): controller.variable.Scolarite.text);
     final int paiement= int.parse(controller.variable.Paiement.text==""?0.toString(): 
    controller.variable.Paiement.text );
     if (result) {
    if(controller.isFraisAnnexe.value && controller.isFraisInscription.value){
               
                  if(scolarite<paiement){
                  TLoader.errorSnack(title: "MONTANT",
                  message:"Le montant de paiement saisit est supérieur à la scolarité");
                  }else{
                     await TInscriptionValidation().H_Enregistrer(); 
                  }
                
              }
              
              
              else{
                TLoader.errorSnack(title: "CASE A COCHE",message:"Veuillez cocher "
                "les cases a cocher pour valider le paiement");
              }
            }
   }

   H_OnVerification({TModelEleve? data}){
    final index = controller.DataTableInscription.indexWhere((e) => e.IDEtudiant==data!.IDEtudiant);
    if(index !=-1){
       TLoader.warningSnack(title: "ELEVE",message: "${data!.NomComplet} est déjà inscrit(e)");
    }
    return index;
   }

  void H_onChangeFraisAnnexe(bool? value){
    controller.isFraisAnnexe.value = value!;
  }
 
   void H_onChangeFraisInscription(bool? value){
    controller.isFraisInscription.value = value!;
  }

   void H_OnChangedDate()async{
   final date= await TShowDate().H_RecupDate();
   if(date==null) return;
   controller.variable.DateInscription.value.text = TFormatters.formatDateFr(date).toString();
   controller.DataInscription.value.DateInscription = date;
  } 
 
   void H_OnChangedDateProchainVersement()async{
   final date= await TShowDate().H_RecupDate(dateLointaine: true);
   if(date==null) return;
   controller.variable.DateProchainVersement.text = TFormatters.formatDateFr(date).toString();
   controller.DataInscription.value.DateProchainVersement = date;
  }

 H_OnChangedMethodePaiement(value){
  controller.DataInscription.value.TypePaiement =value;
 }

H_onSelectScolarite({int? id}){

 final index= controllerScolrite.DataTableScolarite.indexWhere((element) => element.IDNiveauScolaire==id &&
 element.TypeScolarite==ControllerEleve.DataEleve.value.Statut,);
             
  if(index==-1){
   TLoader.warningSnack(title: "SCOLARITE",message: "Vous n'avez pas encore definir de scolarite");
    return index;
    }
  
  controllerScolrite.DataScolarite.value = controllerScolrite.DataTableScolarite[index];
   



   return index;

}

H_onSelectClasse(){
  
   if(ControllerClasse.DataClasse.value.IDClasse !=null){

         final data = controllerScolrite.DataScolarite.value.DataTable!.first;

         String dateChaine ="${data.JourMois} ${DateTime.now().year}";
         int? montant = data.Montant;

           controller.variable.DateProchainVersement.text = TFormatters.formatChaineVersDateFr(dateChaine);
          controller.DataInscription.value.DateProchainVersement = TFormatters.formatChaineVersDateAng(dateChaine);

          ///// PAIEMENT 
          controller.variable.MontantVersement.text =montant.toString();
          controller.DataInscription.value.MontantVersement =montant;
        }
}

} 