


import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecole/Configs/utils/Constant/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../utils/Constant/colors.dart';
import '../../../utils/Constant/sizes.dart';
import '../Shimmer/shimmer_effect.dart';

class TRoundeImages extends StatelessWidget {
  const TRoundeImages({
    super.key,
    this.width=56,
    this.height=56,
    this.borderRadius = TSizes.md,
    required this.image,
    this.applyImageRaduis = true,
    this.border,
    this.backgroundColor = TColors.light,
    this.fit = BoxFit.contain,
    this.padding =TSizes.sm,
    this.imageType = ImageType.asset,
    this.onPressed,
    this.file,
    this.overlayColor,
    this.memoryImage,
    this.margin,
  });
  final double? width;
  final double? height;
  final double? borderRadius;
  final File? file;
  final String image;
  final bool applyImageRaduis;
  final BoxBorder? border;
  final Color? backgroundColor;
  final Color? overlayColor;
  final Uint8List? memoryImage;
  final BoxFit? fit;
  final double? padding;
  final double? margin;
  final ImageType imageType;
  final VoidCallback? onPressed;
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height,
        width:  width,
        margin: margin !=null ? EdgeInsets.all(margin!):null,
        padding:  EdgeInsets.all(padding!),

        decoration: BoxDecoration(border: border,color: backgroundColor,borderRadius: BorderRadius.circular(borderRadius!)),
        child: _buildImageWidget()
        )
    );
  }

Widget _buildImageWidget(){
  Widget imageWidget;

  switch(imageType){
    case ImageType.network :
     imageWidget = _buildNetWorkImage();
     break;
     case ImageType.memory : 
     imageWidget = _buildMemoryImage();
     break;
     case ImageType.file : 
     imageWidget = _buildFileImage();
     break;
     case ImageType.asset : 
     imageWidget = _buildAssetImage();
     break;
  }

  return ClipRRect(
            borderRadius: applyImageRaduis ? BorderRadius.circular(borderRadius!): BorderRadius.zero,
          child:imageWidget ,
      );   
}

Widget _buildNetWorkImage(){
  
  if (image.isNotEmpty) {
    return CachedNetworkImage(
      fit: fit,
      color: overlayColor,
      imageUrl: image,
      errorWidget: (context, url, error) => Icon(Icons.error),
      progressIndicatorBuilder: (context, url, downloadProgress) =>TShimmerEffect(width: width,height: height,),
    );
  }else{
    return Container();
  }
}

Widget _buildMemoryImage(){
  if (memoryImage !=null) {
    return Image(image: MemoryImage(memoryImage!),fit: fit,color: overlayColor,);
  }else{
    return Container();
  }
}

Widget _buildFileImage(){
  if (file !=null) {
    return Image(image: FileImage(file!),fit: fit,color: overlayColor,);
  }else{
    return Container();
  }
}


Widget _buildAssetImage(){
  if (image.isNotEmpty) {
    return Image(image: AssetImage(image),fit: fit,color: overlayColor,);
  }else{
    return Container();
  }
}



}





