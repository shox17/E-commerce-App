import 'package:ecommerce_app/common/widgets/appbar/appbar.dart';
import 'package:ecommerce_app/common/widgets/images/t_rounded_image.dart';
import 'package:ecommerce_app/common/widgets/texts/product_title_text.dart';
import 'package:ecommerce_app/common/widgets/texts/t_brand_title_text_with_verified_icon.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/image_strings.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: TAppBar(
        title: Text('Cart', style: Theme.of(context).textTheme.headlineSmall),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: ListView.separated(
            shrinkWrap: true,
            separatorBuilder:
                (_, __) => const SizedBox(height: TSizes.spaceBtwSections),
            itemCount: 4,
            itemBuilder:
                (_, index) => Column(
                  children: [
                    Row(
                      children: [
                        /// Image
                        TRoundedImage(
                          imageUrl: TImages.productImage1,
                          width: 60,
                          height: 60,
                          padding: EdgeInsets.all(TSizes.sm),
                          backgroundColor:
                              dark ? TColors.darkerGrey : TColors.light,
                        ),
                        const SizedBox(width: TSizes.spaceBtwItems),

                        /// Title, Price & Size
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TBrandTitleWithVerifiedIcon(title: 'Nike'),
                            TProductTitleText(
                              title: 'Black Sports Shoes',
                              maxLines: 1,
                            ),

                            /// Attributes
                            ///
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
          ),
        ),
      ),
    );
  }
}
