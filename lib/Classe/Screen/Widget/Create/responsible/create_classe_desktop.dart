import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../Configs/Breadcrumbs/breadcrumb.dart';
import '../../../../../Configs/routes/route.dart';
import '../../../../../Configs/utils/Constant/enums.dart';
import '../../../../../Configs/utils/Constant/sizes.dart';
import '../widget/info_classe.dart';


class TCreateClasseDesktopScreen extends StatelessWidget {
  const TCreateClasseDesktopScreen({super.key,this.show = true});
 final bool? show;
  @override
  Widget build(BuildContext context) {
      final argument = Get.arguments;
      final routeName = Get.parameters["route"]??TRoutes.classe;
    return  SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          //  spacing : MediaQuery.of(context).size.height*0.05,
          children: [
            ///// HEADER
              TRetourHeader(titre:
              argument== TraitementAction.nouveau.name?
               "Enregistrement de la Classe":"Modification de la Classe",route:routeName,),
              SizedBox(height: TSizes.spaceBtwItems,),
            SizedBox(
              width: 350,
              child: TClasseInformation(argument: argument,)),
          ],
        ),
      ),
    );
  }
}

