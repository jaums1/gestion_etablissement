
import 'package:flutter/material.dart';

import '../../../../Configs/cammon/widgets/layouts/templates/site_template.dart';
import '../../../../Configs/cammon/widgets/win/move_window.dart';
import 'codeetab_desktop.dart';
import 'codeetab_mobile.dart';
import 'codeetab_tablet.dart';

class TCodeEtablissementScreen extends StatelessWidget {
  const TCodeEtablissementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TMoveWindows(
      child: TSiteTemplate( useLayout: false,
      desktop: TCodeEtablissementDesktop(),
      mobile: TCodeEtablissementMobile(),
      tablet: TCodeEtablissementTablet(),
      ),
    );
  }
}