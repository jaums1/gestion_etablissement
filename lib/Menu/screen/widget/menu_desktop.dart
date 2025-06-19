
import 'package:flutter/material.dart';
// import 'package:get/get.dart';
import '../../../Configs/cammon/widgets/layouts/headers/header.dart';
// import '../../../Login/Controller/login_controller.dart';
import '../../../Configs/utils/Constant/colors.dart';
import '../SideBar/sidebar.dart';

class MenuDesktopScreen extends StatelessWidget {
  const MenuDesktopScreen({super.key, this.body});
  final Widget? body;
  @override
  Widget build(BuildContext context) {
    
  
    return Scaffold(
      body: Row(
        children: [
          Expanded(child: Container(
           decoration: BoxDecoration(
            color: TColors.white,
            border: Border(right: BorderSide(color: TColors.grey))
           ), 
          child:TSideBar() ,
          )
          
          ),
          Expanded(flex: 5 ,child: Column(
            children: [
               THeader(),
               ///// BODY
            body ?? const SizedBox()
            ],
          )),
        ],
      ),
    );
  }
}
