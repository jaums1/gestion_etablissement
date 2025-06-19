import 'package:ecole/Configs/cammon/widgets/images/rounded_images.dart';
import 'package:ecole/Configs/cammon/widgets/images/t_circular_images.dart';
import 'package:ecole/Configs/utils/Constant/colors.dart';
import 'package:ecole/Configs/utils/Constant/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';

import '../icons/t_circular_icon.dart';

class TImageUploader extends StatelessWidget {
  const TImageUploader(
      {super.key,
      this.circular=false,
      this.image,
      required this.imageType,
      this.width =100,
      this.height=100,
       this.memoryImage,
      this.icon = Iconsax.edit_2,
      this.top,
      this.bottom=0,
      this.rigth,
      this.left=0,
      this.onIconButtonPressed
      });
  final bool? circular;
  final String? image;
  final ImageType imageType;
  final double width;
  final double height;
  final Uint8List? memoryImage;
  final IconData icon;
  final double? top;
  final double? bottom;
  final double? rigth;
  final double? left;
  final void Function()? onIconButtonPressed;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        circular!?TCircularImage(
          imageType: imageType,
          width: width,
          height: height,
          backgroundColor: TColors.primaryBackground,
          image: image.toString()
          ):
        TRoundeImages(
          width: width,
          height: height,
          imageType: imageType,
          backgroundColor: TColors.primaryBackground,
          image: image.toString()
          ),
          Positioned(
            top: top,
            bottom: bottom,
            left: left,
            right: rigth,
            child: TCircularIcon(icon: icon,onPressed: onIconButtonPressed,) )
      ],
    );
  }
}