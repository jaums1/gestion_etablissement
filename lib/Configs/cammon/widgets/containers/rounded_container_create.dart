import 'package:flutter/material.dart';

import '../../../utils/Constant/sizes.dart';
import 'rounded_container.dart';

class TRoundedContainerCreate extends StatelessWidget {
  const TRoundedContainerCreate({super.key, this.child,this.padding=const EdgeInsets.symmetric(horizontal:TSizes.md,vertical: TSizes.sm ),});
 final Widget? child;
 final EdgeInsetsGeometry? padding;
  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
            showShadow: false,
            padding: padding,
             child:child,
          );
  }
}