import 'package:ecole/Configs/cammon/widgets/containers/rounded_container_create.dart';
import 'package:ecole/Configs/cammon/widgets/images/image_uploader.dart';
import 'package:ecole/Configs/utils/Constant/enums.dart';
import 'package:ecole/Configs/utils/Constant/image_string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../Configs/utils/Constant/sizes.dart';
import '../../../../../Configs/utils/Selection_Image/image_picker.dart';
import '../../../../../Configs/utils/TypeFichier/typefichier.dart';
import '../../../../../Configs/utils/http/http_client.dart';
import '../../../../Controller/eleve_controller.dart';


class InfoPhotoEleve extends StatelessWidget {
  final controllerEleve =Get.find<TEleveController>();
   InfoPhotoEleve({super.key});

  @override
  Widget build(BuildContext context) {
     final controller     =Get.put(TPickerImage());

    return TRoundedContainerCreate(
      padding: EdgeInsets.all(TSizes.sm),
      child: SizedBox(
        width: 170,
        child:  Obx(
          (){
          
         controller.pickedImage.value ==null;
         return Center(
                child:TImageUploader(
                bottom: 0.5,
                width: 150,height: 133,
                onIconButtonPressed: () async{
                 await THttpHelper.testMultipart();
                     controller.pickedImage.value=  await controller.imagePicker();
                         
                },     
                        imageType:controller.pickedImage.value==null?ImageType.asset:
                         TTypeFichier.isNetworkFile(controller.pickedImage.value!.path)==true? ImageType.network : ImageType.file,
                         image:controller.pickedImage.value==null?TImages.appLogo:controller.pickedImage.value!.path,
                         
                         )
                        
                         );
  }),
      ),
    );
  }
}