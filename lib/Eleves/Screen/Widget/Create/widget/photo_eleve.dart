import 'package:ecole/Configs/cammon/widgets/containers/rounded_container_create.dart';
import 'package:ecole/Configs/cammon/widgets/images/image_uploader.dart';
import 'package:ecole/Configs/utils/Constant/enums.dart';
import 'package:ecole/Configs/utils/Constant/image_string.dart';
import 'package:flutter/material.dart';

import '../../../../../Configs/utils/Constant/sizes.dart';


class InfoPhotoEleve extends StatelessWidget {
  const InfoPhotoEleve({super.key});

  @override
  Widget build(BuildContext context) {
    return TRoundedContainerCreate(
      padding: EdgeInsets.all(TSizes.sm),
      child: SizedBox(
        width: 170,
        child:  Center(
               child: TImageUploader(
                bottom: 0.5,
                width: 150,height: 133,
                onIconButtonPressed: (){},
                imageType: ImageType.asset, image: TImages.appLogo),
        ),
      ),
    );
  }
}