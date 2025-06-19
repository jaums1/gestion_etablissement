
import 'package:flutter/material.dart';

import '../SideBar/sidebar.dart';

class MenuTabletScreen extends StatelessWidget {
  const MenuTabletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: TSideBar(),
      body: Center(child: Text("Tablet"),),
    );
  }
}