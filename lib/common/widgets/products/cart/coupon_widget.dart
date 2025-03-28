import 'package:ecommerce_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class TCouponCode extends StatelessWidget {
  const TCouponCode({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return TRoundedContainer(
      showBorder: true,
      backgroundColor: dark ? TColors.dark : TColors.white,
      padding: EdgeInsets.only(
        top: TSizes.sm,
        bottom: TSizes.sm,
        right: TSizes.sm,
        left: TSizes.md,
      ),
      child: Row(
        /// TextField
        children: [
          Flexible(
            child: TextFormField(
              decoration: InputDecoration(
                hintText: 'Enter Coupon',
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          ),

          /// Button
          SizedBox(
            width: 80,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                foregroundColor:
                    dark
                        ? TColors.white.withAlpha(128)
                        : TColors.dark.withAlpha(128),
                backgroundColor: Colors.grey.withAlpha(50),
                side: BorderSide(color: Colors.grey.withAlpha(25)),
              ),
              child: Text('Apply'),
            ),
          ),
        ],
      ),
    );
  }
}
