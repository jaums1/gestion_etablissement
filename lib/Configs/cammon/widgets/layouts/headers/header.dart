import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../Login/Controller/user_controller.dart';
import '../../../../utils/Constant/colors.dart';
import '../../../../utils/Constant/image_string.dart';
import '../../../../utils/Constant/sizes.dart';
import '../../../../utils/Device/devices_utility.dart';

class THeader extends StatelessWidget implements PreferredSizeWidget {
  final controllerUser = Get.find<TUserController>();
  THeader({
    super.key,
    this.scaffold,
  });
  final GlobalKey<ScaffoldState>? scaffold;
  @override
  Widget build(BuildContext context) {
    return Container(
      //  padding :EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: TColors.white,
        border: Border(bottom: BorderSide(color: TColors.grey, width: 1)),
      ),
      padding: EdgeInsets.symmetric(horizontal: TSizes.sm, vertical: TSizes.md),
      child: Obx(() => AppBar(
            toolbarHeight: TDeviceUtility.isDesktopScreen(context) == true
                ? 20
                : kToolbarHeight,
            leading: TDeviceUtility.isDesktopScreen(context) == true
                ? null
                : IconButton(
                    onPressed: () => scaffold!.currentState?.openDrawer(),
                    icon: Icon(Iconsax.menu)),
            // title: TDeviceUtility.isDesktopScreen(context)? SizedBox(
            //   width: 400,
            //   child: TextField(
            //     decoration: InputDecoration(hintText: "Search anything",prefixIcon: Icon(Iconsax.search_normal)),
            //   ),
            // ):null,
            actions: [
              Text(
                controllerUser.DataUserPrincipale.value.user.toString(),
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              CircleAvatar(
                backgroundImage: AssetImage(
                  TImages.avatareImage,
                ),
                backgroundColor: TColors.darkGrey,
                foregroundColor: TColors.darkGrey,
              )
            ],
          )),
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(TDeviceUtility.getAppBarHeight() + 15);
}
