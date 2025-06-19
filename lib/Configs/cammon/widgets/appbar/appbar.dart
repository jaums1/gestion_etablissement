
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/Device/devices_utility.dart';
import '../../../utils/Constant/sizes.dart';


class TAppBar extends StatelessWidget implements PreferredSizeWidget{
  const TAppBar({super.key, this.title, this.showBackArrow=false, this.leadingIcon, this.action, this.leadingOnPressed});
  final Widget? title;
  final bool showBackArrow ;
  final IconData? leadingIcon ;
  final List<Widget>? action ;
  final VoidCallback? leadingOnPressed ;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:const EdgeInsets.symmetric(horizontal: TSizes.md),
      child: AppBar(
        automaticallyImplyLeading: false,
        leading: showBackArrow? IconButton(onPressed:() => Get.back(), icon: const Icon(Iconsax.arrow_left))
        :leadingIcon !=null? IconButton(onPressed:leadingOnPressed, icon: Icon(leadingIcon)):null,
        title: title,
        actions: action,
        
      ),
    );
  }
  
  @override
  Size get preferredSize => Size.fromHeight(TDeviceUtility.getAppBarHeight());
}