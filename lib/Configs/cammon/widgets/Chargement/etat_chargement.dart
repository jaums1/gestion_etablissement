import 'package:ecole/Configs/cammon/widgets/texts/text_widget.dart';
import 'package:flutter/material.dart';

import '../../../utils/Constant/image_string.dart';
import '../../../utils/Popup/animation_loader.dart';

class TEtatChargement {
  
  static Widget H_EtatChargement({VoidCallback? onPressedChargement}){
    return SingleChildScrollView(
      child: FutureBuilder(
            future: Future.delayed(const Duration(seconds: 10)),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                // Si après 10s on est toujours en loading
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.timelapse, size: 50, color: Colors.orange),
                      const SizedBox(height: 16),
                      TTextCustom.body(text: 'Chargement trop long',color: Colors.grey ),
                      TextButton(
                        onPressed: onPressedChargement??(){},
                        child: const Text('Réessayer'),
                      ),
                    ],
                  ),
                );
              }
              return Center(
                child: TAnimationLoaderWidget(
                  text: "Chargement en cours...",
                  animation: TImages.docerAnimation,
                  width: 250,
                ),
              );
            },
          ),
    );
  }

  static Widget H_ChargementCircle({VoidCallback? onPressedChargement}){
    return SingleChildScrollView(
      child: FutureBuilder(
            future: Future.delayed(const Duration(seconds: 10)),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                // Si après 10s on est toujours en loading
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.timelapse, size: 50, color: Colors.orange),
                      const SizedBox(height: 16),
                      TTextCustom.body(text: 'Chargement trop long',color: Colors.grey ),
                      TextButton(
                        onPressed: onPressedChargement??(){},
                        child: const Text('Réessayer'),
                      ),
                    ],
                  ),
                );
              }
              return Center(
                child: CircularProgressIndicator()
              );
            },
          ),
    );
  }




  static Widget H_EtatDataVide({VoidCallback? onPressedChargement,double? height=250,double? width=200}){
    return Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // const Icon(Icons.hourglass_empty, size: 50, color: Colors.blue),
                // const SizedBox(height: 16),
                TAnimationLoaderWidget(
                text: 'Aucune donnée disponible',
                animation: TImages.videAnimation,height: height,width: width,),
                // TTextCustom.body(text: 'Aucune donnée disponible',color: Colors.grey ),
                // const SizedBox(height: 16),
                TextButton(
                  onPressed: onPressedChargement??(){},
                  child: const Text('Actualiser'),
                ),
              ],
            ),
          ),
        );
      }

}