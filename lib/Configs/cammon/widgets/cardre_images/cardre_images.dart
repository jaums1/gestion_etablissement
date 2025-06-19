
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';

import '../../../utils/Constant/colors.dart';
import '../../../utils/Selection_Image/image_picker.dart';
import '../../../utils/TypeFichier/typefichier.dart';

// ignore: must_be_immutable
class TCardreImage extends StatelessWidget {
TCardreImage({super.key, this.valeur, this.height, this.width =double.infinity});
  XFile? valeur;
final double? height;
final double? width;

  @override
  Widget build(BuildContext context) {
  
   final controller     =Get.isRegistered<TPickerImage>()==false?Get.put(TPickerImage()):
   Get.find<TPickerImage>();
    
    return Obx(
      ()=> InkWell(
        onTap: () async{
       valeur=  await controller.imagePicker();
      //  print(valeur!.path);
        },
        child: Padding(padding: EdgeInsets.all(8),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              controller.pickedImage.value ==null?
              ///// AUCUNE IMAGE SELECTIONNER
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [ Icon(Iconsax.gallery_import,size: 40,color: TColors.primary,),
                 Padding(padding: const EdgeInsets.all(15.0),
                   child: Text("Cliquez ici pour sélectionner une image",textAlign: TextAlign.center,style: Theme.of(context).textTheme.bodyMedium,),
                 )
                ],
              ) :
              /////// AVEC UNE IMAGE
              Image(
                fit: BoxFit.cover,
                image: TTypeFichier.isNetworkFile(controller.pickedImage.value!.path)==true?
               NetworkImage(controller.pickedImage.value!.path):FileImage(File(controller.pickedImage.value!.path))
              ),
            ],
          ),
        ),
        ),
      ),
    );
  }
}