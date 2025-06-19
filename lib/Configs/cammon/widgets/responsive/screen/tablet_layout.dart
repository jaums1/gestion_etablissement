import 'package:flutter/material.dart';

import '../../layouts/headers/header.dart';

import '../../layouts/sidebar/sidebars.dart';

class TabletLayout extends StatelessWidget {
  TabletLayout({super.key, this.body});
 final Widget? body;
    final GlobalKey<ScaffoldState> scaffold = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffold,
      appBar: THeader(scaffold: scaffold,),
      drawer: TSideBars(),
      body: body ?? Container(),
    );
  }
}