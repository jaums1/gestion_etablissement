
import 'package:ecole/Configs/utils/Constant/texte_string.dart';
import 'package:ecole/Login/Controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../Menu/screen/SideBar/items_menu.dart';
import '../../../../../routes/route.dart';
import '../../../../../utils/Constant/enums.dart';

class TListeItems extends StatelessWidget {
  const TListeItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<TUserController>();
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal:  4.0),
        child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         mainAxisSize: MainAxisSize.min,
         children: [

          ///// ADMINISTRATEUR
         if(controller.DataUserPrincipale.value.role.toString().toLowerCase()==AppRole.Admin.name.toLowerCase())
         Flexible(
          child: Column(
          children: [
              /// DASHBORD
        TItemsMenu(text: TText.Dashboard,iconData: Iconsax.menu,route: TRoutes.dashboard,),
        ///// GESTION PEDAGOGIE
        TItemsMenu(text: TText.Eleve, iconData: Iconsax.profile_2user, route: TRoutes.eleve),
        TItemsMenu(text: TText.Classe, iconData: Iconsax.building_4, route: TRoutes.classe),
        TItemsMenu(text: TText.Salle, iconData: Iconsax.building, route: TRoutes.salles),
        TItemsMenu(text: TText.Enseignant, iconData: Iconsax.teacher, route: TRoutes.enseignant),
        TItemsMenu(text: TText.Notes, iconData: Iconsax.menu_board, route: TRoutes.notes),
        TItemsMenu(text: TText.Emplois_du_Temps, iconData: Iconsax.calendar_edit, route: TRoutes.emploisDuTemps),

       /////// Gestion administrative & financière
       TItemsMenu(text: TText.Inscription, iconData: Iconsax.wallet, route: TRoutes.inscription),
       TItemsMenu(text: TText.Scolarite, iconData: Iconsax.wallet_check, route: TRoutes.scolarite),
       TItemsMenu(text: TText.Employe, iconData: Iconsax.briefcase, route: TRoutes.employe),

       ///// Utilisateurs
       TItemsMenu(text: TText.User,iconData: Iconsax.user_cirlce_add,route: TRoutes.utilisateur,)

       ////PARAMETTRE
        // TItemsMenu(text: TText.Eleve,iconData: Iconsax.safe_home,route: TRoutes.eleve,),
          ],
         ))
         ///// SECRETAIRE
       else if(controller.DataUserPrincipale.value.role.toString().toLowerCase()==AppRole.Secretaire.name.toLowerCase())  
          Flexible(
          child: Column(
          children: [
              /// DASHBORD
        TItemsMenu(text: TText.Dashboard,iconData: Iconsax.menu,route: TRoutes.dashboard,),
        ///// GESTION PEDAGOGIE
        TItemsMenu(text: TText.Eleve, iconData: Iconsax.profile_2user, route: TRoutes.eleve),
        TItemsMenu(text: TText.Classe, iconData: Iconsax.building_4, route: TRoutes.classe),
        TItemsMenu(text: TText.Salle, iconData: Iconsax.building, route: TRoutes.salles),
        TItemsMenu(text: TText.Enseignant, iconData: Iconsax.teacher, route: TRoutes.enseignant),
        TItemsMenu(text: TText.Notes, iconData: Iconsax.menu_board, route: TRoutes.notes),
        TItemsMenu(text: TText.Emplois_du_Temps, iconData: Iconsax.calendar_edit, route: TRoutes.emploisDuTemps),

       /////// Gestion administrative & financière
       TItemsMenu(text: TText.Inscription, iconData: Iconsax.wallet, route: TRoutes.inscription),
       TItemsMenu(text: TText.Employe, iconData: Iconsax.briefcase, route: TRoutes.employe),

       ///// Utilisateurs

       ////PARAMETTRE
        // TItemsMenu(text: TText.Eleve,iconData: Iconsax.safe_home,route: TRoutes.eleve,),
          ],
         ))
        
         ///// ENSEIGNANT
          else if(controller.DataUserPrincipale.value.role.toString().toLowerCase()==AppRole.Enseignant.name.toLowerCase())  
          Flexible(
          child: Column(
          children: [
              /// DASHBORD
        TItemsMenu(text: TText.Dashboard,iconData: Iconsax.menu,route: TRoutes.dashboard,),
        ///// GESTION PEDAGOGIE
        TItemsMenu(text: TText.Classe, iconData: Iconsax.building_4, route: TRoutes.classe),
        TItemsMenu(text: TText.Notes, iconData: Iconsax.menu_board, route: TRoutes.notes),
        TItemsMenu(text: TText.Emplois_du_Temps, iconData: Iconsax.calendar_edit, route: TRoutes.emploisDuTemps),

  

       ///// Utilisateurs

       ////PARAMETTRE
        // TItemsMenu(text: TText.Eleve,iconData: Iconsax.safe_home,route: TRoutes.eleve,),
          ],
         ))
         
         ],
        ),
      ),
    );
  }
}