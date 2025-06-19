
class TValidator {
  static String? validateEmptyText(String? fieldName,String? value ){
  if (value==null || value.isEmpty) {
    return "$fieldName is required";
  }
  return null;
  }
  
 static String? validateEmail(String? value ){
  if (value==null || value.isEmpty) {
    return "Email est vide";
  }
  
  final emailRegExp=RegExp(r'^[\w-\.]+@([\w.]+\.)+[\w-]{2,4}$');

  if (!emailRegExp.hasMatch(value)) {
    return 'Email nom valide';
  }
  
  return null;

 }


 static String? validatePassword(String? value){
  if (value==null || value.isEmpty) {
    return "Mot de passe requise";
  }

  if (value.length<6) {
    return 'Votre mot de passe doit être de 6 caractères';
  }

  if (value.contains(RegExp(r'[A-Z]'))) {
     return 'Le mot de passe doit contenir le(s) lettre(s) en majuscule(s)';
   }
   
    if (value.contains(RegExp(r'[0-9]'))) {
     return 'Le mot de passe doit contenir le(s) chiffres';
   }

   if (value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
     return 'Le mot de passe doit contenir les caractères speciaux';
   }


    return null;
 }



static String? validatePhoneNumber(String? value){
 if (value==null || value.isEmpty) {
    return "Numéro de téléphone requise";
  }

  final phoneRegExp=RegExp(r'^\d{10}$');

  if (!phoneRegExp.hasMatch(value)) {
    return 'Numéro de téléphone nom valide';
  }
  return null;

}
}