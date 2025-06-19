import 'package:flutter/material.dart';
import 'configuration_body_right.dart';
import 'sidebar_configuration.dart';



class TBodyConfigurationScreen extends StatelessWidget {
  const TBodyConfigurationScreen({super.key,});
  @override
  Widget build(BuildContext context) {
    return 
    SizedBox(
      // width: 800,
      height: 450,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: TSideBarConfiguartion()),
           Expanded(
            flex: 4,
            child: TConfigurationBodyRight()
            )
        ],
      ),
    );
  }
}
