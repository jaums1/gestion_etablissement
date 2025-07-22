import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;

class TPickerImage extends GetxController {
  final  pickedImage = (null as XFile?).obs;      //Rx<XFile?>; 
  // pickedImage.
 Future<XFile> imagePicker() async{
    final ImagePicker picker = ImagePicker();
     pickedImage.value = await picker.pickImage(source: ImageSource.gallery);
      
    return pickedImage.value!;
  }


 imageChangeNom(XFile? fichier){
   final String newFileName = "profil_${DateTime.now().millisecondsSinceEpoch}${path.extension(fichier!.path)}";
   return newFileName;   
 }
}
