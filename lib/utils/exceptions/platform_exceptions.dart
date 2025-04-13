/// Exception class for handling various platform-related errors.
class TPlatformException implements Exception {
  final String code;

  TPlatformException(this.code);

  String get message {
    switch (code) {
      // Authentication errors
      case 'INVALID_LOGIN_CREDENTIALS':
        return 'Invalid login credentials. Please double-check your information.';
      case 'invalid-email':
        return 'The email address is badly formatted.';
      case 'user-disabled':
        return 'This user account has been disabled.';
      case 'user-not-found':
        return 'No user found with this email address.';
      case 'wrong-password':
      case 'invalid-password':
        return 'Incorrect password. Please try again.';
      case 'email-already-in-use':
        return 'This email address is already in use by another account.';
      case 'operation-not-allowed':
        return 'The sign-in provider is disabled for your Firebase project.';
      case 'weak-password':
        return 'The password is too weak. Please choose a stronger password.';
      case 'requires-recent-login':
        return 'This operation requires recent authentication. Please log in again.';
      case 'account-exists-with-different-credential':
        return 'An account already exists with the same email but different sign-in credentials.';
      case 'invalid-credential':
        return 'The supplied credential is malformed or has expired.';
      case 'invalid-user-token':
        return 'The user\'s credential is no longer valid. Please sign in again.';

      // Phone authentication
      case 'invalid-phone-number':
        return 'The provided phone number is invalid.';
      case 'invalid-verification-code':
        return 'Invalid verification code. Please enter a valid code.';
      case 'invalid-verification-id':
        return 'Invalid verification ID. Please request a new verification code.';
      case 'code-expired':
        return 'The verification code has expired. Please request a new one.';
      case 'missing-verification-code':
        return 'Please enter the verification code.';
      case 'missing-verification-id':
        return 'Verification ID is missing. Please try again.';
      case 'quota-exceeded':
        return 'Quota exceeded. Please try again later.';

      // Session/Token errors
      case 'session-cookie-expired':
        return 'The Firebase session cookie has expired. Please sign in again.';
      case 'invalid-auth-event':
        return 'An invalid authentication event occurred.';

      // User management
      case 'uid-already-exists':
        return 'The provided user ID is already in use by another user.';
      case 'user-mismatch':
        return 'The supplied credentials do not correspond to the signed-in user.';
      case 'user-token-expired':
        return 'The user\'s token has expired. Please sign in again.';

      // Network/System errors
      case 'network-request-failed':
        return 'Network request failed. Please check your internet connection.';
      case 'too-many-requests':
        return 'Too many requests. Please try again later.';
      case 'internal-error':
        return 'Internal error. Please try again later.';
      case 'app-not-authorized':
        return 'This app is not authorized to use Firebase Authentication.';
      case 'keychain-error':
        return 'A keychain error occurred. Please try again.';
      case 'invalid-api-key':
        return 'Invalid API key. Please check your configuration.';

      // Database/Storage errors
      case 'permission-denied':
        return 'You don\'t have permission to access this resource.';
      case 'unavailable':
        return 'The service is currently unavailable. Please try again later.';
      case 'data-loss':
        return 'Data loss occurred. Please contact support.';
      case 'deadline-exceeded':
        return 'The operation timed out. Please try again.';

      // General errors
      case 'invalid-argument':
        return 'Invalid argument provided to the authentication method.';
      case 'sign_in_failed':
        return 'Sign-in failed. Please try again.';
      case 'cancelled':
        return 'The operation was cancelled.';
      case 'already-exists':
        return 'The item you are trying to create already exists.';
      case 'not-found':
        return 'The requested resource was not found.';
      case 'aborted':
        return 'The operation was aborted.';
      case 'out-of-range':
        return 'The operation was attempted past the valid range.';
      case 'unimplemented':
        return 'This operation is not implemented or supported.';
      case 'failed-precondition':
        return 'The system was not in the required state for the operation.';

      default:
        return 'An unexpected platform error occurred. Please try again.';
    }
  }
}
