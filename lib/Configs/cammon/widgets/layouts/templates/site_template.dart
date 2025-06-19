import 'package:flutter/material.dart';
import '../../responsive/responsive_designd.dart';
import '../../responsive/screen/desktop_layout.dart';
import '../../responsive/screen/mobile_layout.dart';
import '../../responsive/screen/tablet_layout.dart';
import '../../win/move_window.dart';


class TSiteTemplate extends StatelessWidget {
  const TSiteTemplate({super.key, this.desktop, this.mobile, this.tablet, this.useLayout =true});
  final Widget ? desktop;
    final Widget ? mobile;
    final Widget ? tablet;
    final bool useLayout;
  @override
  Widget build(BuildContext context) {
    return TMoveWindows(
      child: ResponsiveDesignd(
        desktop: useLayout==true ? DesktopLayout(body: desktop,):desktop??Container(),
        mobile: useLayout==true ? MobileLayout(body: mobile ?? desktop,):mobile ??desktop??Container(),
        tablet: useLayout==true ? TabletLayout(body: tablet ?? desktop,):tablet ??desktop??Container(),
      ),
    );
  }
}