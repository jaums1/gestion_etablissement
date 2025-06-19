

import 'package:flutter/cupertino.dart';

import '../../../../utils/Constant/colors.dart';

class TCircularContainer extends StatelessWidget {
  const TCircularContainer({super.key, this.child, this.backgroundColor=TColors.white,
   this.width=400,this.heigth=400,this.raduis=400,this.padding=0,this.margin});
final double? width;
final double? heigth;
final double? raduis;
final double? padding;
final Widget? child;
final Color backgroundColor;
final EdgeInsetsGeometry? margin;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: heigth,
      padding: EdgeInsets.all(padding!),
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(raduis!),
        color: backgroundColor
      ),
      child: child,
    );
  }
}