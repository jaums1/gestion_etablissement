
import 'package:flutter/material.dart';

import '../../utils/Constant/sizes.dart';

class TSpacingStyle {
  static const EdgeInsetsGeometry paddingWithAppBarHeight=EdgeInsets.only(
    top: TSizes.appBarHeight,
    left: TSizes.defaultSpace,
    right: TSizes.defaultSpace,
    bottom: TSizes.defaultSpace,
  );
  static const EdgeInsetsGeometry paddingWithAppBarHeightTablet=EdgeInsets.only(
    top: TSizes.appBarHeight-30,
    left: TSizes.defaultSpace,
    right: TSizes.defaultSpace,
    bottom: TSizes.defaultSpace-14,
  );
}