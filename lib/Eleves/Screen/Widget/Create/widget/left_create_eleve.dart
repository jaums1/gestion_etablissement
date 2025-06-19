import 'package:ecole/Configs/utils/Device/devices_utility.dart';
import 'package:flutter/material.dart';
import '../../../../../Configs/cammon/widgets/containers/rounded_container.dart';
import 'info_parent_eleve.dart';
import 'info_perso_eleve.dart';
import 'info_regime_statut_eleve.dart';

class TLeftCreateEleve extends StatelessWidget {
  const TLeftCreateEleve({super.key});

  @override
  Widget build(BuildContext context) {
    return TDeviceUtility.isMobileScreen(context)?TLeftCreateEleveMobile() : TLeftCreateEleveDesktop()
    ;
  }
}

class TLeftCreateEleveMobile extends StatelessWidget {
  const TLeftCreateEleveMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TRoundedContainer(
                showShadow: false,
                child:TInformationPersoEleve(),
              ),
      ],
    );
  }
}


class TLeftCreateEleveDesktop extends StatelessWidget {
  const TLeftCreateEleveDesktop({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
       crossAxisAlignment: CrossAxisAlignment.start,
      children: [
       
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right:  10.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.height*0.50,
              child: TRoundedContainer(
                showShadow: false,
                child:TInformationPersoEleve(),
              ),
            ),
          ),
        ),
        Expanded(
          child: SizedBox(
                width: MediaQuery.of(context).size.height*0.50,
                child: Column(
                 
          children: [
            TRoundedContainer(
                  showShadow: false,
                  child:TInformationRegimeEleve(),
                ),
                 SizedBox(height: 10,),
                  TRoundedContainer(
                  showShadow: false,
                  child:TInformationParentEleve(),
                                  ),
           
          ],
                ),
          ),
        ),
      ],
    );
  }
}