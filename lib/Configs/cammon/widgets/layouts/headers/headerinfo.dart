import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import '../../../../utils/Constant/colors.dart';
import '../../../../utils/Constant/image_string.dart';

class THeaderInfo extends StatelessWidget {
  const THeaderInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
              padding: const EdgeInsets.symmetric(vertical:4.0),
              child: Container(
                height: 100,
                color: Colors.white,
                child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      child: Row(
                        children: [
                          SizedBox(width: 4,),
                          SizedBox(height: 45,child: Image.asset(TImages.appLogo),),
                          SizedBox(width: 10,),
                          Text("ECOLE PLUS",style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                   color: TColors.primary.withValues(alpha: 0.6),fontSize: 17,letterSpacing: 1.5,
                                  fontWeight: FontWeight.bold
                                 ),),
                        ],
                      ),
                    ),
                    

                    SizedBox(
                      child: WindowTitleBarBox(
                          child: Row(
                            
                            children: [
                              InkWell(onTap: (){}, child: MinimizeWindowButton(animate: true)),
                              InkWell(onTap: (){}, child: MaximizeWindowButton(animate: true)),
                              InkWell(onTap: (){}, child: CloseWindowButton(animate: true)),
                            ],
                          ),
                        ),
                    )
                   
                  ],
                ),
              ),
            );
  }
}