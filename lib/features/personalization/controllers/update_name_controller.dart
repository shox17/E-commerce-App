import 'package:ecommerce_app/data/repositories/authentication/user/user_repository.dart';
import 'package:ecommerce_app/features/personalization/controllers/user_controller.dart';
import 'package:ecommerce_app/features/personalization/screens/profile/profile.dart';
import 'package:ecommerce_app/utils/constants/image_strings.dart';
import 'package:ecommerce_app/utils/helpers/network_manager.dart';
import 'package:ecommerce_app/utils/popups/full_screen_loader.dart';
import 'package:ecommerce_app/utils/popups/loaders.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();

  /// init user data when Home Screen appears
  @override
  void onInit() {
    super.onInit();
    initializeNames();
  }

  /// Fetch user record
  Future<void> initializeNames() async {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }

  Future<void> updateUserName() async {
    try {
      /// Start Loading
      TFullScreenLoader.openLoadingDialog(
        'We are updating your information...',
        TImages.docerAnimation,
      );

      /// Check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      /// Form validation
      if (!updateUserNameFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      /// Update user's first & last name in the Firebase Firestore
      Map<String, dynamic> name = {
        'FirstName': firstName.text.trim(),
        'LastName': lastName.text.trim(),
      };
      await userRepository.updateSingleField(name);

      /// Update the Rx User value
      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();

      /// Remove Loading Indicator
      TFullScreenLoader.stopLoading();

      /// Show success message
      TLoaders.successSnackBar(
        title: 'Congratulations',
        message: 'Your name has been updated successfully.',
      );

      /// Move to previous screen
      Get.off(() => ProfileScreen());
    } catch (e) {
      /// Remove Loading Indicator
      TFullScreenLoader.stopLoading();

      /// Show some error to the user
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
