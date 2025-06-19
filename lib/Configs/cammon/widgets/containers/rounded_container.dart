

import 'package:flutter/material.dart';

import '../../../utils/Constant/colors.dart';
import '../../../utils/Constant/sizes.dart';

class TRoundedContainer extends StatelessWidget {
  const TRoundedContainer(
      {super.key,
      this.width,
      this.height,
      this.radius=TSizes.cardeRaduisSm,
      this.child,
      this.showBorder=false,
      this.backgroundColor=TColors.white,
      this.borderColor=TColors.borderPrimary,
      this.padding=const EdgeInsets.all(TSizes.md),
      this.margin,
      this.showShadow=true});
  final double? width, height, radius;
  final Widget? child;
  final bool showBorder,showShadow;
  final Color backgroundColor, borderColor;
  final EdgeInsetsGeometry? padding, margin;
 
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: width,
        height: height,
        padding: padding,
        margin: margin,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(radius!),
          border: showBorder ? Border.all(color: borderColor) : null,
          boxShadow: [
            if(showShadow)
            BoxShadow(
              color: TColors.grey.withValues(alpha: 1),
              spreadRadius:5,
              blurRadius:8,
              offset: Offset(0, 3)
            )
          ]
        ),
        child: child,
      ),
    );
  }
}