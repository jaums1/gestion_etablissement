import 'package:flutter/material.dart';
import '../../../utils/Constant/sizes.dart';
import '../containers/rounded_container.dart';

class TViewScreen extends StatelessWidget {
  const TViewScreen({super.key, required this.child});
final Widget child;

  @override
  Widget build(BuildContext context) {
   
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(TSizes.md),
        child: Container(
        
           decoration: BoxDecoration(
            color: Colors.white
          ),
          child:Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                
                child: TRoundedContainer(child:  child,)),
            ],
          ))
        )
        );
  }
}