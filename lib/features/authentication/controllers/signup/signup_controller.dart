import 'package:ecommerce_app/utils/constants/image_strings.dart';
import 'package:ecommerce_app/utils/helpers/network_manager.dart';
import 'package:ecommerce_app/utils/popups/full_screen_loader.dart';
import 'package:ecommerce_app/utils/popups/loaders.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  /// Variables
  /// OBservable variable to show/hide password
  final hidePassword = true.obs;

  /// Observable variable for privacy policy acceptance
  final privacyPolicy = true.obs;

  /// Controller for email input
  final email = TextEditingController();

  /// Controller for last name input
  final lastName = TextEditingController();

  /// Controller for username input
  final username = TextEditingController();

  /// Controller for password input
  final password = TextEditingController();

  /// Controller for first name input
  final firstName = TextEditingController();

  /// Controller for phone number input
  final phoneNumber = TextEditingController();

  /// Form Key for form validation
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  /// -- SignUp
  Future<void> signup() async {
    try {
      /// Start Loading
      TFullScreenLoader.openLoadingDialog(
        'We are processing your information...',
        TImages.docerAnimation,
      );

      /// Check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) return;

      /// Form validation
      if (!signupFormKey.currentState!.validate()) return;

      /// Check if privacy policy is accepted
      if (!privacyPolicy.value) {
        TLoaders.warningSnackBar(
          title: 'Accept Privacy Policy',
          message:
              'In order to create an account, you have to read and accept the Privacy Policy & Terms of Use.',
        );
        return;
      }
    } catch (e) {
      /// Show some error to the user
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      /// Remoce Loading Indicator
      TFullScreenLoader.stopLoading();
    }
  }
}
