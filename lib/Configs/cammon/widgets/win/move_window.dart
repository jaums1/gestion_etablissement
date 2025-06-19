import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:ecole/Configs/utils/Device/devices_utility.dart';
import 'package:flutter/widgets.dart';
import 'package:window_manager/window_manager.dart';

class TMoveWindows extends StatelessWidget {
  const TMoveWindows({super.key, this.child});
final Widget? child;
  @override
  Widget build(BuildContext context) {
    return TDeviceUtility.isDesktop()==true ?MoveWindow(onDoubleTap:()=> WindowCaptionButton.unmaximize()
    ,child: child,):child!;
  }
}