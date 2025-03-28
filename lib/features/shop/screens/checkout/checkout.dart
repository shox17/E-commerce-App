import 'package:ecommerce_app/common/widgets/appbar/appbar.dart';
import 'package:ecommerce_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ecommerce_app/common/widgets/products/cart/coupon_widget.dart';
import 'package:ecommerce_app/common/widgets/success_screen/success_screen.dart';
import 'package:ecommerce_app/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:ecommerce_app/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:ecommerce_app/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:ecommerce_app/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:ecommerce_app/navigation_menu.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/image_strings.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: TAppBar(
        title: Text(
          'Order Review',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// -- Items in Cart
              TCartItems(showAddRemoveButtons: false),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// -- Coupoun TextField
              TCouponCode(),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// -- Billing Section
              TRoundedContainer(
                showBorder: true,
                padding: EdgeInsets.all(TSizes.md),
                backgroundColor: dark ? TColors.black : TColors.white,
                child: Column(
                  children: [
                    /// Pricing
                    TBillingAmountSection(),
                    const SizedBox(height: TSizes.spaceBtwItems),

                    /// Divider
                    const Divider(),
                    const SizedBox(height: TSizes.spaceBtwItems),

                    /// Payment Methods
                    TBillingPaymentSection(),
                    const SizedBox(height: TSizes.spaceBtwItems),

                    /// Address
                    TBillingAddressSection(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
          onPressed:
              () => Get.to(
                () => SuccessScreen(
                  image: TImages.successfulPaymentIcon,
                  title: 'Payment Success!',
                  subTitle: 'Your items will be delivered soon!',
                  onPressed: () => Get.offAll(() => NavigationMenu()),
                ),
              ),
          child: Text('Checkout \$290.0'),
        ),
      ),
    );
  }
}
