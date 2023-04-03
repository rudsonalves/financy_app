import 'dart:developer';

import 'package:financy_app/services/auth_service.dart';
import 'package:flutter/foundation.dart';

import 'sign_ip_state.dart';

class SignInController extends ChangeNotifier {
  final AuthService _service;

  SignInController(this._service);

  SignInState _state = SignInStateInitial();

  SignInState get state => _state;

  void _changeState(SignInState newState) {
    _state = newState;
    notifyListeners();
  }

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    _changeState(SignInStateLoading());

    try {
      await _service.signIn(
        email: email,
        password: password,
      );

      _changeState(SignInStateSuccess());
    } catch (error) {
      log(error.toString());
      _changeState(SignInStateError(error.toString()));
    }
  }
}
