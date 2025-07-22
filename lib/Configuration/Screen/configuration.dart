
import 'package:ecole/Configs/cammon/widgets/win/move_window.dart';
import 'package:ecole/Configs/utils/Constant/texte_string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Configs/cammon/widgets/ShowDialog/header_show.dart';
import '../../Configs/cammon/widgets/win/window.dart';
import 'Widget/configuration_body.dart';



class TConfigurationScreen extends StatelessWidget {
  const TConfigurationScreen({super.key});

  @override
  Widget build(BuildContext context) {
  
    // TWindow().changeDimensionFenetre(largeur:1000,hauteur:  700);
    TWindow().changeDimensionFenetre(largeur:950,hauteur:  600);

  
    return TMoveWindows(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                spacing: 30,
                children: [
                Flexible(child: THeaderShowDialog(tilte:TText.configuration.tr  ,)),
                Flexible(
                  flex: 5,
                  child: TBodyConfigurationScreen()),
                    
                ],
              )),
          ),)
      ),
    );
  }

    getDialog(){
    return  showDialog(context: Get.context!,
     builder: (BuildContext context){
      return TConfigurationScreen();
     }
     
     );

  }


  }


  
