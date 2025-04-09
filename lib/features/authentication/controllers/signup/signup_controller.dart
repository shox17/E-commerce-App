import 'package:ecommerce_app/data/repositories/authentication/authentication_repository.dart';
import 'package:ecommerce_app/data/repositories/authentication/user/user_repository.dart';
import 'package:ecommerce_app/features/authentication/screens/signup/verify_email.dart';
import 'package:ecommerce_app/features/personalization/models/user_model.dart';
import 'package:ecommerce_app/utils/constants/image_strings.dart';
import 'package:ecommerce_app/utils/helpers/network_manager.dart';
import 'package:ecommerce_app/utils/popups/full_screen_loader.dart';
import 'package:ecommerce_app/utils/popups/loaders.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      /// Form validation
      if (!signupFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      /// Check if privacy policy is accepted
      if (!privacyPolicy.value) {
        TLoaders.warningSnackBar(
          title: 'Accept Privacy Policy',
          message:
              'In order to create an account, you have to read and accept the Privacy Policy & Terms of Use.',
        );
        return;
      }

      /// Register the user in the Firebase Authentication & Save the user data in Firebase
      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
            email.text.trim(),
            password.text.trim(),
          );

      /// Save Authenticated user data in Firebase Firestore
      final newUser = UserModel(
        id: userCredential.user!.uid,
        email: email.text.trim(),
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        username: username.text.trim(),
        profilePicture: '',
      );

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      ///Remove Loading Indicator
      TFullScreenLoader.stopLoading();

      /// Show Success Message
      TLoaders.successSnackBar(
        title: 'Congratulations!',
        message:
            'Your account has been created successfully. Verify email to continue.',
      );

      /// Move to Verify Email Screen
      Get.to(() => const VerifyEmailScreen());
    } catch (e) {
      /// Remove Loading Indicator
      TFullScreenLoader.stopLoading();

      /// Show some error to the user
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
