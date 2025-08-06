
import 'package:ecole/Configs/cammon/widgets/containers/rounded_container_create.dart';
import 'package:ecole/Configs/utils/Constant/colors.dart';
import 'package:ecole/Configs/utils/Constant/image_string.dart';
import 'package:ecole/Configs/utils/Popup/animation_loader.dart';
import 'package:flutter/material.dart';

import '../../../Configs/utils/Constant/sizes.dart';

class FormTerminerConfig extends StatelessWidget {
  const FormTerminerConfig({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(TSizes.md),
      child: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: TRoundedContainerCreate(child: Center(
          child: Column(
            children: [
              
              TAnimationLoaderWidget(animation: TImages.completedAnimation,height: 250,width: 250,),
              Text("Configuration Terminée",style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 20,color: TColors.darkGrey,letterSpacing: 3
              ),),
            ],
          )
       )) ,
      ),
    );
  }
}