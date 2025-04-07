import 'package:ecommerce_app/features/authentication/controllers/signup/signup_controller.dart';
import 'package:ecommerce_app/features/authentication/screens/signup/widgets/terms_conditions_checkbox.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/constants/text_strings.dart';
import 'package:ecommerce_app/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TSignUpForm extends StatelessWidget {
  const TSignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    return Form(
      key: controller.signupFormKey,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller.firstName,
                  validator:
                      (value) =>
                          TValidator.validateEmptyText('First name', value),
                  expands: false,
                  decoration: InputDecoration(
                    labelText: TTexts.firstName,
                    prefixIcon: const Icon(Iconsax.user),
                  ),
                ),
              ),
              const SizedBox(width: TSizes.spaceBtwInputFields),
              Expanded(
                child: TextFormField(
                  controller: controller.lastName,
                  validator:
                      (value) =>
                          TValidator.validateEmptyText('Last name', value),
                  expands: false,
                  decoration: InputDecoration(
                    labelText: TTexts.lastName,
                    prefixIcon: const Icon(Iconsax.user),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),

          /// --UserName
          TextFormField(
            controller: controller.username,
            validator:
                (value) => TValidator.validateEmptyText('Username', value),
            expands: false,
            decoration: InputDecoration(
              labelText: TTexts.username,
              prefixIcon: const Icon(Iconsax.user_edit),
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),

          /// --Email
          TextFormField(
            controller: controller.email,
            validator: (value) => TValidator.validateEmail(value),
            decoration: InputDecoration(
              labelText: TTexts.email,
              prefixIcon: const Icon(Iconsax.direct),
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),

          /// --Phone Number
          TextFormField(
            controller: controller.phoneNumber,
            validator: (value) => TValidator.validatePhoneNumber(value),
            decoration: InputDecoration(
              labelText: TTexts.phoneNo,
              prefixIcon: const Icon(Iconsax.call),
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),

          /// --Password
          Obx(
            () => TextFormField(
              controller: controller.password,
              validator: (value) => TValidator.validatePassword(value),
              obscureText: controller.hidePassword.value,
              decoration: InputDecoration(
                labelText: TTexts.password,
                prefixIcon: const Icon(Iconsax.password_check),
                suffixIcon: IconButton(
                  onPressed:
                      () =>
                          controller.hidePassword.value =
                              !controller.hidePassword.value,
                  icon: Icon(
                    controller.hidePassword.value
                        ? Iconsax.eye_slash
                        : Iconsax.eye,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwSections),

          /// --Terms and Conditions Checkbox
          TTermsAndConditionsCheckbox(),
          const SizedBox(height: TSizes.spaceBtwSections),

          /// --SignUp Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () async {
                await controller.signup();
              },
              child: Text(TTexts.createAccount),
            ),
          ),
        ],
      ),
    );
  }
}
