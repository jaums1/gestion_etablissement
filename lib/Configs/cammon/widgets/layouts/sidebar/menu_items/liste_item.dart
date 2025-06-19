
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../Menu/screen/SideBar/items_menu.dart';
import '../../../../../routes/route.dart';

class TListeItems extends StatelessWidget {
  const TListeItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal:  4.0),
        child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         mainAxisSize: MainAxisSize.min,
         children: [
        TItemsMenu(text: "Dashboard",iconData: Iconsax.menu,route: TRoutes.dashboard,),
        TItemsMenu(text: "Eleve",iconData: Iconsax.safe_home,route: TRoutes.eleve,),
        TItemsMenu(text: "Inscription",iconData: Iconsax.wallet,route: TRoutes.inscription,),
        TItemsMenu(text: "Scolarite",iconData: Iconsax.user,route: TRoutes.scolarite,),
        TItemsMenu(text: "Enseignant",iconData: Iconsax.teacher,route: TRoutes.enseignant,),
        TItemsMenu(text: "Employe",iconData: Iconsax.teacher,route: TRoutes.employe,),
        TItemsMenu(text: "Notes",iconData: Iconsax.menu_board,route: TRoutes.notes,),
        TItemsMenu(text: "Salle",iconData: Iconsax.direct_right,route: TRoutes.salles,),
        TItemsMenu(text: "Classe",iconData: Iconsax.home,route: TRoutes.classe,),
        TItemsMenu(text: "Emplois du Temps",iconData: Iconsax.note,route: TRoutes.emploisDuTemps,),
         ],
        ),
      ),
    );
  }
}