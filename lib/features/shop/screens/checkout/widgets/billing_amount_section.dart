import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TBillingAmountSection extends StatelessWidget {
  const TBillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            /// SubTotal
            Text('Subtotal', style: Theme.of(context).textTheme.bodyMedium),
            Text('\$290.0', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 2),

        /// Shipping Fee
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            /// SubTotal
            Text('Shipping Fee', style: Theme.of(context).textTheme.bodyMedium),
            Text('\$6.0', style: Theme.of(context).textTheme.labelLarge),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 2),

        /// Tax Fee
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            /// SubTotal
            Text('Tax Fee', style: Theme.of(context).textTheme.bodyMedium),
            Text('\$10.0', style: Theme.of(context).textTheme.labelLarge),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 2),

        /// Order Total
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            /// SubTotal
            Text('Order Total', style: Theme.of(context).textTheme.bodyMedium),
            Text('\$306.0', style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
      ],
    );
  }
}
