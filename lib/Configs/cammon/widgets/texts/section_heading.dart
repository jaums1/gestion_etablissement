
import 'package:flutter/material.dart';

class TSelectionHeading extends StatelessWidget {
  const TSelectionHeading({
    super.key, this.textColor, this.showActionButtom=true, required this.title,  this.buttonTitle="View all", this.onPressed,
  });
final Color? textColor;
final bool showActionButtom;
final String title,buttonTitle;
final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,style: Theme.of(context).textTheme.headlineSmall!.apply(color: textColor),maxLines: 1,overflow: TextOverflow.ellipsis,),
       if(showActionButtom) TextButton(onPressed: (){}, child:  Text(buttonTitle))
      ],
    );
  }
}
