import 'package:ecommerce_app/data/repositories/authentication/authentication_repository.dart';
import 'package:ecommerce_app/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:ecommerce_app/utils/constants/image_strings.dart';
import 'package:ecommerce_app/utils/helpers/network_manager.dart';
import 'package:ecommerce_app/utils/popups/full_screen_loader.dart';
import 'package:ecommerce_app/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  /// Variables
  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  /// Send Password Reset Email
  sendPasswordResetEmail() async {
    try {
      /// Start Loading
      TFullScreenLoader.openLoadingDialog(
        'Processing your request ...',
        TImages.docerAnimation,
      );

      /// Check Internet Connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      /// Form Validation
      if (!forgetPasswordFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      /// Send Password Reset Email
      await AuthenticationRepository.instance.sendPasswordResetEmail(
        email.text.trim(),
      );

      /// Stop Loading
      TFullScreenLoader.stopLoading();

      /// Show Success Message
      TLoaders.successSnackBar(
        title: 'Email Sent',
        message: 'Please check your inbox to reset your password',
      );

      /// Redirect
      Get.to(() => ResetPasswordScreen(email: email.text.trim()));
    } catch (e) {
      /// Stop Loading
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }

  resendPasswordResetEmail(String email) async {
    try {
      /// Start Loading
      TFullScreenLoader.openLoadingDialog(
        'Processing your request ...',
        TImages.docerAnimation,
      );

      /// Check Internet Connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      /// Send Password Reset Email
      await AuthenticationRepository.instance.sendPasswordResetEmail(email);

      /// Stop Loading
      TFullScreenLoader.stopLoading();

      /// Show Success Message
      TLoaders.successSnackBar(
        title: 'Email Sent',
        message: 'Please check your inbox to reset your password',
      );
    } catch (e) {
      /// Stop Loading
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
}
