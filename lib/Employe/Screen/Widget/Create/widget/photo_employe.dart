import 'package:ecole/Configs/cammon/widgets/images/image_uploader.dart';
import 'package:ecole/Configs/utils/Constant/enums.dart';
import 'package:ecole/Configs/utils/Constant/image_string.dart';
import 'package:ecole/Configs/utils/Constant/sizes.dart';
import 'package:flutter/material.dart';


class TCreatePhotoEmploye extends StatelessWidget {
  const TCreatePhotoEmploye({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: TSizes.md),
      child: SizedBox(
        child: TImageUploader(
         bottom: 0.5,
         width: 90,height: 90,
         onIconButtonPressed: (){},
         imageType: ImageType.asset, image: TImages.appLogo),
      ),
    );
  }
}