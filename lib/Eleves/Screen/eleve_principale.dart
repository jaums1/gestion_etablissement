import 'package:flutter/material.dart';

import '../../Configs/cammon/widgets/responsive/screen/desktop_layout.dart';
import 'Widget/eleve_screen.dart';

class TElevePrincipaleScreen extends StatelessWidget {
  const TElevePrincipaleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DesktopLayout(body: TEleveScreen(),);
  }
}