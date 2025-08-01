import 'package:ecole/Configs/utils/Constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class TShimmerEffect extends StatelessWidget {
  const TShimmerEffect({super.key, this.width =56,this.height=56, this.child});
  final double? width;
  final double? height;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Shimmer.fromColors(
        baseColor: TColors.primaryBackground,
        highlightColor: TColors.darkGrey,
        child: child!,
        ),
    );
  }
}
