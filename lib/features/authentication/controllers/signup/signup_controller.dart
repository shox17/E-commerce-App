import 'package:ecommerce_app/utils/constants/image_strings.dart';
import 'package:ecommerce_app/utils/helpers/network_manager.dart';
import 'package:ecommerce_app/utils/popups/full_screen_loader.dart';
import 'package:ecommerce_app/utils/popups/loaders.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  /// Variables
  final email = TextEditingController();

  /// Controller for email input
  final lastName = TextEditingController();

  /// Controller for last name input
  final username = TextEditingController();

  /// Controller for username input
  final password = TextEditingController();

  /// Controller for password input
  final firstName = TextEditingController();

  /// Controller for first name input
  final phoneNumber = TextEditingController();

  /// Controller for phone number input
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  /// Form Key for form validation

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
    } catch (e) {
      /// Show some error to the user
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      /// Remoce Loading Indicator
      TFullScreenLoader.stopLoading();
    }
  }
}
