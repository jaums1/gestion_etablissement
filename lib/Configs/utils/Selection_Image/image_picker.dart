import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class TPickerImage extends GetxController {
  final  pickedImage = (null as XFile?).obs;      //Rx<XFile?>; 
  // pickedImage.
 Future<XFile> imagePicker() async{
    final ImagePicker picker = ImagePicker();
     pickedImage.value = await picker.pickImage(source: ImageSource.gallery);
    // final XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);
      
    return pickedImage.value!;
  }
}
