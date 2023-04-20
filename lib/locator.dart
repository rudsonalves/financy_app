import 'package:financy_app/features/sign_in/sign_in_controller.dart';
import 'package:financy_app/features/sign_up/sign_up_controller.dart';
import 'package:financy_app/services/auth_service.dart';
import 'package:financy_app/services/mock_auth_servide.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void setupDependendies() {
  locator.registerLazySingleton<AuthService>(() => MockAuthService());

  locator.registerFactory<SignInController>(
      () => SignInController(locator.get<AuthService>()));

  locator.registerFactory<SignUpController>(
      () => SignUpController(locator.get<AuthService>()));
}
