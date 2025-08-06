
import 'package:ecole/Configs/utils/Constant/colors.dart';
import 'package:flutter/material.dart';
import '../../../utils/Constant/sizes.dart';
import '../../../utils/Device/devices_utility.dart';


class TAppBarHeaderScreen extends StatelessWidget implements PreferredSizeWidget{
  const TAppBarHeaderScreen({super.key, this.title, this.child,this.action});
  final String? title;
  final Widget? child;
  final List<Widget>? action ;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: TColors.primaryBackground,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title:Text(title!,style: Theme.of(context).textTheme.titleMedium!.copyWith(
          fontSize: 20,color: TColors.darkGrey,letterSpacing: 2
        ),),
        actions: action,),
        body:Padding(
        padding: const EdgeInsets.only(
        right: TSizes.sm, left: TSizes.sm, bottom: TSizes.sm),
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: child ,)
        ) 
    );
    
  
  }
  
  @override
  Size get preferredSize => Size.fromHeight(TDeviceUtility.getAppBarHeight());
  
}


  //  Padding(
  //     padding:const EdgeInsets.symmetric(horizontal: TSizes.md),
  //     child: 
  //   );