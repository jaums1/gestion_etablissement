
import 'package:flutter/cupertino.dart';

import '../../../../utils/Constant/colors.dart';
import '../curved_edges/curved_edges_widget.dart';
import 'circular_containers.dart';

class TPrimaryHeaderContainer extends StatelessWidget {
  const TPrimaryHeaderContainer({super.key, required this.child});
 final Widget child;
  @override
  Widget build(BuildContext context) {
    return CurvedEdgesWidget(
             child: Container(
                color: TColors.primary,
                padding: const EdgeInsets.all(0),
                child: SizedBox(
                  height: 365,
                  child: Stack(
                    children: [
                      Positioned(top:-150,right: -250,child: TCircularContainer(backgroundColor: TColors.textWhite.withValues(alpha: 0.1),)),
                      Positioned(top:100,right: -300,child: TCircularContainer(backgroundColor: TColors.textWhite.withValues(alpha:  0.1),)),
                      child,
                    ],
                  ),
                ),
              ),
            );
  }
}