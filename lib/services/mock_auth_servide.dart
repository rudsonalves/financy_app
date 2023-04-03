import '../common/models/user_model.dart';
import './auth_service.dart';

class MockAuthService implements AuthService {
  @override
  Future<UserModel> signIn({
    required String email,
    required String password,
  }) async {
    try {
      await Future.delayed(const Duration(seconds: 2));
      if (password.startsWith('123')) {
        throw Exception();
      }
      return UserModel(
        id: email.hashCode,
        email: email,
      );
    } catch (error) {
      if (password.startsWith('123')) {
        throw 'Login error. Try again.';
      }
    }
    throw 'Unable to log in to your account. Try later.';
  }

  @override
  Future<UserModel> signUp({
    String? name,
    required String email,
    required String password,
  }) async {
    try {
      await Future.delayed(const Duration(seconds: 2));
      if (password.startsWith('123')) {
        throw Exception();
      }
      return UserModel(
        id: email.hashCode,
        name: name,
        email: email,
      );
    } catch (error) {
      if (password.startsWith('123')) {
        throw 'Insecure password.';
      }
    }
    throw 'Unable to create your account.';
  }
}
