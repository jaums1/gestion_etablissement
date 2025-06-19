import 'package:flutter/material.dart';
import '../../../../utils/Constant/colors.dart';
import 'menu_items/header_items.dart';
import 'menu_items/liste_item.dart';


class TSideBars extends StatelessWidget {
  const TSideBars({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Drawer(
      shape: BeveledRectangleBorder(),
      child: Container(
        decoration: BoxDecoration(
          color: TColors.white,
          border: Border(right: BorderSide(color: TColors.grey,width: 1))
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
               THeaderItems(),
               Padding(padding: const EdgeInsets.symmetric(vertical:  15.0,horizontal: 8),
                 child: Divider(height: 1,thickness: 0.7,),
               ),
               TListeItems()
            ],
          ),
        ),
      ),
    );
  }
}
