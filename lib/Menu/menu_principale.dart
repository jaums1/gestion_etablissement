
import 'package:flutter/material.dart';

import '../Configs/cammon/widgets/layouts/templates/site_template.dart';
import '../Configs/cammon/widgets/win/window.dart';
import '../Configs/utils/Device/devices_utility.dart';
import 'dashboard.dart';
import 'screen/widget/menu_mobile.dart';
import 'screen/widget/menu_tablet.dart';


class TMenuPrincipalScreen extends StatelessWidget {
  const TMenuPrincipalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TDeviceUtility.isDesktop()==true? TWindow().FullWindow() : null;
    return TSiteTemplate(useLayout: true,
    mobile: MenuMobileScreen(),
    desktop: TDashboardScreen(),
    tablet: MenuTabletScreen(),
    );
  }
}