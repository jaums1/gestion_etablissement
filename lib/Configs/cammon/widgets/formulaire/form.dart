
import 'package:ecole/Configs/utils/Constant/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

// import '../../../utils/Constant/colors.dart';
import '../../../utils/validators/validation.dart';


class TFormulaire {
 

  TextFormField textFormField({
   bool? isPadding=false,String? label,bool isPassword=false,IconData? iconOpen,IconData? iconOff,IconData? iconPrefix,IconData? iconSuffix,
   VoidCallback? onPressedIcon,
   TextEditingController? textEditingController,TextInputType? textInputType = TextInputType.text,bool? isVerification =false,
  String? libError="Champ requis",ValueChanged? onChanged,bool? isIconSuffix=false,bool? isVerifiePass =false,bool? isVerifieEmail=false
  ,String? hintText,double? vertical=14.0,double? horizontal=14.0,bool? readOnly=false
  }){
    return TextFormField(
  keyboardType: textInputType ==TextInputType.number?TextInputType.numberWithOptions(decimal: true):textInputType,
   inputFormatters: [
      if(textInputType ==TextInputType.number )FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*'))
   ],
   controller: textEditingController,
   validator: (value)=>isVerification==false?null:
   isVerifieEmail==true?TValidator.validateEmail(value):
   isVerifiePass ==true?TValidator.validatePassword(value):
  textInputType== TextInputType.number && (value==0.toString() || value!.isEmpty )? libError: TValidator.validateEmptyText(label, value),
   readOnly: readOnly ?? false,
  
   onChanged:onChanged ,
   obscureText: isPassword,
          decoration: InputDecoration(
            hintText:hintText ,
             isDense:isPadding ==false?false: true,
            contentPadding: isPadding ==false?null: EdgeInsets.symmetric(vertical: vertical!, horizontal: horizontal!),
              label:label=="" || label==null?null: Text(label.toString()),
            prefixIcon: iconPrefix==null?null: Icon(iconPrefix),
            suffixIcon:isIconSuffix ==true?IconButton(onPressed: onPressedIcon,
             icon: Icon(!isPassword ==false?iconOff:iconOpen))
             :iconSuffix ==null?null:Icon(iconSuffix), //iconSuffix ,
          ),
         );
  }


  formulaireTextCheval({ String ?label,bool isPassword=false,IconData? iconOpen,IconData? iconOff,IconData? iconPrefix,IconData? iconSuffix,
  VoidCallback? onPressedIcon,bool? isphone=false,bool? readOnly=false,bool? isint=true,
   TextEditingController? textEditingController,TextInputType? textInputType = TextInputType.text,bool? isVerification =false,
   bool? isIconSuffix=false,bool? isVerifiePass =false,bool? isVerifieEmail=false,Function(dynamic)? onChanged
  }){
  return Padding(
    padding:isphone==true?EdgeInsets.zero :const EdgeInsets.only(bottom: TSizes.sm+3),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // RichText(
        //   overflow: TextOverflow.ellipsis,
        //   text: TextSpan(
        //   text: label,style: Theme.of(Get.context!).textTheme.bodyMedium,
        //   children: [
        //     isPassword==true || isVerification ==true || isVerifieEmail==true || isVerifiePass==true ?
        //     TextSpan(text: "*",style: Theme.of(Get.context!).textTheme.headlineSmall!.apply(
        //       color: TColors.error
        //     ),)
        //     :TextSpan()
        //   ]
        // )),
        Text(label!,style: Theme.of(Get.context!).textTheme.bodyMedium,maxLines: 1,overflow: TextOverflow.ellipsis,),
        TextFormField(
          onChanged:onChanged ,
          focusNode: FocusNode(),
          
          readOnly: readOnly!,
         keyboardType: textInputType ==TextInputType.number?TextInputType.numberWithOptions(decimal:isint==true?false:true):textInputType,
     inputFormatters: [
        if(textInputType ==TextInputType.number && isint==false  )FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
        if(textInputType ==TextInputType.number && isint==true )FilteringTextInputFormatter.allow(RegExp(r'^\d*')),
        if(textInputType ==TextInputType.text  && isphone==true )FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
     ],
     maxLength: isphone==true ?10:null,
     controller: textEditingController,
     validator: (value)=>isVerification==false?null:isVerifieEmail==true?TValidator.validateEmail(value):
     isVerifiePass ==true?TValidator.validatePassword(value): TValidator.validateEmptyText(label, value),
     obscureText: isPassword,
            decoration: InputDecoration(
              
              contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
              isDense: true,
              prefixIcon: iconPrefix==null?null: Icon(iconPrefix),
              suffixIcon:isIconSuffix ==true?IconButton(onPressed: onPressedIcon,
              icon: Icon(!isPassword ==false?iconOff:iconOpen))
              :iconSuffix ==null?null:Icon(iconSuffix),
        
             
            ),
           )
      ],
    ),
  );
  }
}