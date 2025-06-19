import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TRetourHeader extends StatelessWidget {
  const TRetourHeader({super.key, this.route, this.titre});
final String? route;
final String? titre;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
       IconButton(onPressed: ()=> Get.offNamed(route!), icon: Icon(Icons.arrow_back)),
       SizedBox(width: 10,),
       Expanded(child: Text(titre!,style: Theme.of(context).textTheme.headlineSmall,maxLines: 1,overflow: TextOverflow.ellipsis,)),
      ],
    );
    }
    }