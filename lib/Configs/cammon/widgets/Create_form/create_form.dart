import 'package:flutter/material.dart';

import '../../../utils/Constant/sizes.dart';

class TCreateForm extends StatelessWidget {
  const TCreateForm({super.key, required this.child});
final Widget child;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: child,
        )
        );
  }
}