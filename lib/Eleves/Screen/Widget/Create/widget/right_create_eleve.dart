import 'package:ecole/Configs/cammon/widgets/images/image_uploader.dart';
import 'package:ecole/Configs/utils/Constant/enums.dart';
import 'package:ecole/Configs/utils/Constant/image_string.dart';
import 'package:flutter/material.dart';

import '../../../../../Configs/cammon/widgets/containers/rounded_container.dart';

class TRightCreatePhotoEleve extends StatelessWidget {
  const TRightCreatePhotoEleve({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 170,
      child: TRoundedContainer(
           showShadow: false,
           child: Center(
             child: TImageUploader(
              bottom: 0.5,
              
              width: 100,height: 100,
              onIconButtonPressed: (){},
              imageType: ImageType.asset, image: TImages.appLogo),
           ),
      
      ),
    );
  }
}