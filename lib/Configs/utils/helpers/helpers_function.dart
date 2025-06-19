

import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:intl/intl.dart';

class THelperFunctions{

  static Color? getColor(String value){
    
    if (value=='Green') {
      return Colors.green;
    }else if(value=='Red'){
       return Colors.red;
    }else if(value=='Blue'){
       return Colors.blue;
  }  else if(value=='Pink'){
       return Colors.pink;
    }else if(value=='Grey'){
       return Colors.grey;
  } else if(value=='Purpel'){
       return Colors.purple;
    }else if(value=='Black'){
       return Colors.black;
  }else if(value=='White'){
       return Colors.white;
  }else if(value=='Brown'){
       return Colors.brown;
    }else if(value=='teal'){
       return Colors.teal;
  }else if(value=='Indigo'){
       return Colors.indigo;
  }
    return null;
}

static void showSnackBar (String message){
  ScaffoldMessenger.of(Get.context!).showSnackBar(
    SnackBar(content: Text(message))
  );
}


static showAlert(String title,String message){
  showDialog(context: Get.context!, builder:(BuildContext context){
    return AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        TextButton(onPressed:()=>Navigator.of(context).pop(), child: const Text('OK'))
      ],
    );
  });
}

static void navigateScreen(BuildContext context,Widget screen){
  Navigator.push(context,
  MaterialPageRoute(builder: (_)=>screen)
   );
}


static String truncateText(String texte,int maxLenght){
  if (texte.length <= maxLenght ) {
    return texte;
  } else{
    return '${texte.substring(0,maxLenght)}...';
  }
}

static bool isDarkMode(BuildContext context){
  return Theme.of(context).brightness==Brightness.dark;
}

static Size screenSize(){
  return MediaQuery.of(Get.context!).size;
}

static double screenHeight(){
  return MediaQuery.of(Get.context!).size.height;
}

static double screenWidth(){
  return MediaQuery.of(Get.context!).size.width;
}

static String getFormattedDate (DateTime date,{String format='dd MMM yyyy'}){
  return DateFormat(format).format(date);
}

static List<T> removeDuplicates<T> (List<T> liste){
  return liste.toSet().toList();
}

static List<Widget> wrapWidgets(List<Widget> widget,int rowSize){
  final wrappedListe=<Widget>[];
  for (var i = 0; i < widget.length; i++) {
    final rowChildren=widget.sublist(i, i+ rowSize > widget.length ? widget.length : i+ rowSize);
    wrappedListe.add(Row(children: rowChildren,));
  }
  return wrappedListe;
}


}