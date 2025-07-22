import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../Constant/colors.dart';
import '../Constant/sizes.dart';

class TAnimationLoaderWidget extends StatelessWidget {
  const TAnimationLoaderWidget({super.key, this.text="Vide", this.style, this.animation,
   this.showAction, this.actionText, 
   this.onActionPressed, this.width,
    this.height, this.color= Colors.white});
  final String? text;
  final TextStyle? style;
  final String? animation;
  final bool? showAction;
  final String? actionText;
  final VoidCallback? onActionPressed;
  final double? width,height;
  final Color ? color;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Lottie.asset(animation!,width: width,height: height??MediaQuery.of(context).size.height*0.6),
        Text(text!,style: style??Theme.of(context).textTheme.headlineSmall!.apply(
          color: color??TColors.darkGrey
        ),
        
        textAlign: TextAlign.center,),
        //  const SizedBox(height: TSizes.defaultSpace,),
        //  SizedBox(
        //   width: 250,
        //   child: OutlinedButton(
        //     onPressed: onActionPressed,
        //     style: OutlinedButton.styleFrom(backgroundColor:TColors.dark ),
        //    child: Text(text!,
        //   style: style??Theme.of(context).textTheme.bodyMedium!.apply(color: TColors.light),
          
        //   ),
        //   ),
        //  )
        ],
      )
    );
  }
}