import 'package:flutter/material.dart';

import '../SideBar/sidebar.dart';

class MenuMobileScreen extends StatelessWidget {
  const MenuMobileScreen
({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: TSideBar(),
      body: Center(child: Text("Mobile"),),
    );
  }
}