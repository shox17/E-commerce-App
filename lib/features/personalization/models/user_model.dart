import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/utils/formatters/formatter.dart';

/// A model class representing a user in the application.
class UserModel {
  /// Keep those values final you do not want to update
  final String id;
  final String email;
  String firstName;
  String lastName;
  final String username;
  String phoneNumber;
  String profilePicture;

  /// Constructor for UserModel
  UserModel({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.phoneNumber,
    required this.profilePicture,
  });

  /// Helper function to get the full name of the user
  String get fullName => '$firstName $lastName';

  ///Helper function to format the phone number
  String get formattedPhoneNo => TFormatter.formatPhoneNumber(phoneNumber);

  /// Static function to split the full name into first and last names
  static List<String> nameParts(fullName) => fullName.split(' ');

  /// static function to generate a username from full name
  static String generateUsername(fullName) {
    List<String> nameParts = fullName.split(' ');
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : '';

    String camelCaseUsername = '$firstName$lastName';

    /// Combine first and last name
    String usernameWithPrefix = 'cwt_$camelCaseUsername';

    /// Add prefix to the username
    return usernameWithPrefix;

    /// Return the generated username
  }

  /// Static function to create an empty user model
  static UserModel empty() => UserModel(
    id: '',
    email: '',
    firstName: '',
    lastName: '',
    username: '',
    phoneNumber: '',
    profilePicture: '',

    /// Default profile picture URL
  );

  /// Convert model to JSON structure for storing data in Firebase
  Map<String, dynamic> toJson() => {
    'Email': email,
    'FirstName': firstName,
    'LastName': lastName,
    'Username': username,
    'PhoneNumber': phoneNumber,
    'ProfilePicture': profilePicture,
  };

  /// Factory method to crete a UserModel from a Firebase document snapshot
  factory UserModel.fromSnapshot(
    DocumentSnapshot<Map<String, dynamic>> document,
  ) {
    if (document.data() != null) {
      final data = document.data()!;
      return UserModel(
        id: document.id,
        email: data['Email'] ?? '',
        firstName: data['FirstName'] ?? '',
        lastName: data['LastName'] ?? '',
        username: data['Username'] ?? '',
        phoneNumber: data['PhoneNumber'] ?? '',
        profilePicture: data['ProfilePicture'] ?? '',

        /// Default profile picture URL
      );
    } else {
      return UserModel.empty();

      /// Return empty user model if no data found
    }
  }
}
