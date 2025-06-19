import 'package:flutter/material.dart';

import '../../../utils/Constant/colors.dart';
import '../../../utils/Constant/helper_function.dart';
import '../../../utils/Constant/sizes.dart';

class TCircularIcon extends StatelessWidget {
  const TCircularIcon({
    super.key, this.width=30, this.height=30, this.size=TSizes.lg, required this.icon, this.color,
     this.backgroundColor, this.onPressed,
    
  });
  final double? width, height , size;
  final IconData icon;
  final Color? color, backgroundColor;
  final VoidCallback? onPressed;
 

  @override
  Widget build(BuildContext context) {
     final  dark= THelperFunction.isDarkMode(context);
    return Container(
      alignment: Alignment.center,
      height: height,
      width: width,
      decoration: BoxDecoration(
        color:backgroundColor != null ? backgroundColor! : dark ? TColors.black.withValues(alpha:  0.9) :  TColors.white.withValues(alpha:  0.9),
         borderRadius: BorderRadius.circular(size!), 
      ),
      child:  Align(
        alignment: Alignment.center,
        child: IconButton(onPressed:onPressed, icon:  Icon(icon,color: color,size: size,))),
    );
  }
}
