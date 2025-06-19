import 'package:flutter/material.dart';

import '../../Configs/cammon/widgets/responsive/screen/desktop_layout.dart';
import 'Widget/view/employe_screen.dart';

class TEmployePrincipaleScreen extends StatelessWidget {
  const TEmployePrincipaleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DesktopLayout(body: TEmployeScreen(),);
  }
}