import 'package:ecommerce_app/data/repositories/authentication/user/user_repository.dart';
import 'package:ecommerce_app/features/personalization/models/user_model.dart';
import 'package:ecommerce_app/utils/popups/loaders.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final userRepository = Get.put(UserRepository());

  /// Save User Record from any Registration provider
  Future<void> saveUserRecord(UserCredential? userCredential) async {
    try {
      if (userCredential != null) {
        // Convert Name to First and Last Name
        final nameParts = UserModel.nameParts(
          userCredential.user?.displayName ?? '',
        );
        final username = UserModel.generateUsername(
          userCredential.user?.displayName ?? '',
        );

        // Map User Data
        final user = UserModel(
          id: userCredential.user!.uid,
          firstName: nameParts[0],
          lastName: nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
          username: username,
          email: userCredential.user!.email ?? '',
          phoneNumber: userCredential.user?.phoneNumber ?? '',
          profilePicture: userCredential.user?.photoURL ?? '',
        );

        /// Save User Data to Firestore
        await userRepository.saveUserRecord(user);
      }
    } catch (e) {
      TLoaders.warningSnackBar(
        title: "Data not Saved",
        message:
            'Something went wrong while saving your information. You can re-save your data in your Profile',
      );
    }
  }
}
