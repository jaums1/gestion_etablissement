// ignore_for_file: unrelated_type_equality_checks
import 'package:ecole/Configs/cammon/widgets/win/window.dart';
import 'package:ecole/Configs/utils/Device/devices_utility.dart';
import 'package:flutter/material.dart';
import '../../Configs/cammon/widgets/layouts/templates/site_template.dart';
import '../../Configs/cammon/widgets/win/move_window.dart';
import 'Widget/login_desktops.dart';
import 'Widget/login_mobile.dart';
import 'Widget/login_tablet.dart';


class TLoginScreen extends StatelessWidget {
  const TLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
   TDeviceUtility.isDesktop()==true? TWindow().changeDimensionFenetre() : null;
    return TMoveWindows(child: TSiteTemplate(useLayout: false,mobile: TLoginMobileScreen(),desktop: TLoginDesktopScreen(),tablet: TLoginTabletScreen(),));
  }
}