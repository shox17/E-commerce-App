import 'package:ecommerce_app/common/widgets/products/cart/add_remove_button.dart';
import 'package:ecommerce_app/common/widgets/products/cart/cart_item.dart';
import 'package:ecommerce_app/common/widgets/texts/product_price_text.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TCartItems extends StatelessWidget {
  const TCartItems({super.key, this.showAddRemoveButtons = true});

  final bool showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder:
          (_, __) => const SizedBox(height: TSizes.spaceBtwSections),
      itemCount: 2,
      itemBuilder:
          (_, index) => Column(
            children: [
              TCartItem(),
              if (showAddRemoveButtons)
                const SizedBox(height: TSizes.spaceBtwItems),
              if (showAddRemoveButtons)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const SizedBox(width: 70),

                        /// Add Remove Buttons
                        TProductQuantityWithAddRemoveButton(),
                      ],
                    ),

                    /// -- Product total Price
                    TProductPriceText(price: '290'),
                  ],
                ),
            ],
          ),
    );
  }
}
