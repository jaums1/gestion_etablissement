

import 'package:flutter/material.dart';

import '../../../utils/Constant/colors.dart';
import '../../../utils/Device/devices_utility.dart';
import '../../../utils/Constant/helper_function.dart';


class TTabBar extends StatelessWidget implements PreferredSizeWidget {
  const TTabBar({super.key, required this.tabs});
  final List<String> tabs;
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return Material(
      color: dark ? TColors.black : TColors.white,
      child: TabBar(
             tabs: tabs.map((e)=> Tab(child: Text(e),)).toList(),
            isScrollable: true,
            indicatorColor: TColors.primary,
            unselectedLabelColor: TColors.darkGrey,
            labelColor: dark ? TColors.white : TColors.primary,
           
            ),
    );
  }
  
  @override

  Size get preferredSize => Size.fromHeight(TDeviceUtility.getAppBarHeight());
}