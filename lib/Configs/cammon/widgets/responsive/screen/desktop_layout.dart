
import 'package:ecole/Configs/utils/Constant/colors.dart';
import 'package:flutter/material.dart';
import '../../layouts/headers/header.dart';
import '../../layouts/headers/headerinfo.dart';
import '../../layouts/sidebar/sidebars.dart';
import '../../win/move_window.dart';

class DesktopLayout extends StatelessWidget {
  
  const DesktopLayout({super.key, this.body});
  final Widget? body;
  @override
  Widget build(BuildContext context) {
    return TMoveWindows(
      child: Scaffold(
        backgroundColor: TColors.softGrey,
        body: Column(
          children: [
            Expanded(child: THeaderInfo()),
            Expanded(
              flex: 17,
              child: Row(
                children: [
                  Expanded(child: TSideBars()),
                  Expanded(flex: 6, child: Column(
                    children: [
                    ///// HEADER
                    THeader(),
                    ///// BODY
                    Expanded(child: body ?? const SizedBox())
                    ],
                    
                    
                  ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}