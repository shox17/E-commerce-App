import 'package:ecommerce_app/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TBillingAddressSection extends StatelessWidget {
  const TBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TSectionHeading(
          title: 'Shipping Address',
          buttonTitle: 'Change',
          onPressed: () {},
        ),
        Text('Ochilov Shokhrukh', style: Theme.of(context).textTheme.bodyLarge),
        const SizedBox(height: TSizes.spaceBtwItems / 2),
        Row(
          children: [
            Icon(Icons.phone, color: Colors.grey, size: 16),
            const SizedBox(width: TSizes.spaceBtwItems),
            Text(
              '+8210-5698-0844',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 2),
        Row(
          children: [
            Icon(Icons.location_history, color: Colors.grey, size: 16),
            const SizedBox(width: TSizes.spaceBtwItems),
            Expanded(
              child: Text(
                '인천광역시 미추홀구 인주대로 224번길 32-3 금반석빌라 102호',
                style: Theme.of(context).textTheme.bodyMedium,
                softWrap: true,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
