import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:flutter/cupertino.dart';

class TShadowStyle {
  static final verticalProductShadow = BoxShadow(
    color: TColors.darkGrey.withAlpha(25),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0, 2),
  );

  static final horizontalProductShadow = BoxShadow(
    color: TColors.darkGrey.withAlpha(25),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0, 2),
  );
}
