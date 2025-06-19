import 'package:flutter/material.dart';
import '../../../utils/Constant/sizes.dart';

class ResponsiveDesignd extends StatelessWidget {
  const ResponsiveDesignd({super.key, this.desktop, this.mobile, this.tablet});
    final Widget ? desktop;
    final Widget ? mobile;
    final Widget ? tablet;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_,constraints){
      if (constraints.maxWidth >= TSizes.desktopScreenSize ) {
        return desktop!;
      }else if(constraints.maxWidth < TSizes.desktopScreenSize && constraints.maxWidth >= TSizes.tabletScreenSize ){
       return tablet!;
      }else{
        return mobile!;
      }
    });
  }
}