
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/Constant/colors.dart';
import '../../../../utils/Constant/sizes.dart';
import '../../../../utils/Device/devices_utility.dart';
import '../../../styles/spacing_style.dart';
import '../../win/window.dart';

class TLoginTemplate extends StatelessWidget {
  const TLoginTemplate({super.key, this.child, this.retour=false, this.fermer =false});
 final Widget? child;
 final bool? retour;
 final bool? fermer;
  @override

  Widget build(BuildContext context) {
    return Center(
        child: TDeviceUtility.isMobileScreen(context)?TLoginSizeBoxTemplate(retour: retour,fermer: fermer,child: child) :Card(
          elevation: 20,
          child: TLoginSizeBoxTemplate(retour: retour,child: child),
        )
    );
  }
}

class TLoginSizeBoxTemplate extends StatelessWidget {
  const TLoginSizeBoxTemplate({
    super.key,
    required this.child, this.retour, this.fermer,
  });

  final Widget? child;
   final bool? retour;
   final bool? fermer;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 420,
      child: SingleChildScrollView(
        child: Container(
          padding:TDeviceUtility.isDesktopScreen(context) || TDeviceUtility.isMobileScreen(context) ?TSpacingStyle.paddingWithAppBarHeightTablet
          :TSpacingStyle.paddingWithAppBarHeightTablet,
          decoration: BoxDecoration(
            color: TColors.white,
            borderRadius:TDeviceUtility.isDesktop()==true?null: BorderRadius.circular(TSizes.cardeRaduisLg)
          ),
          child:Column(
            children: [
              SizedBox(
                child: Row(
                  mainAxisAlignment:MainAxisAlignment.spaceBetween,
                  children: [
                retour ==true ? IconButton(onPressed:()=>Get.back(), icon:Icon(Icons.arrow_back) ):Container(),
               fermer  ==true?  IconButton(onPressed: ()=>TWindow.closeWindow(), icon:Icon(Icons.close) ):Container(),
                ],),
              ),
              // ElevatedButton.icon(onPressed: (){}, label:Text("Retour") ),
              child!,
            ],
          ))
          )
    );
  }
}

