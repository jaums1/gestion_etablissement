

import 'package:ecole/Configs/cammon/widgets/win/move_window.dart';
import 'package:flutter/material.dart';

import '../../../../Configs/cammon/widgets/layouts/templates/site_template.dart';
import 'register_desktop.dart';
import 'register_mobile.dart';
import 'register_tablet.dart';

class TRegisterScreen extends StatelessWidget {
  const TRegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  TMoveWindows(
      child: TSiteTemplate(
        useLayout: false,
        desktop: TRegisterDesktopScreen(),
        mobile: TRegisterMobileScreen(),
        tablet: TRegisterTabletScreen(),
      ),
    );
  }
}