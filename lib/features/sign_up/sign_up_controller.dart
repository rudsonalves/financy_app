import 'dart:developer';

import 'package:flutter/material.dart';

import './sign_up_state.dart';
import '../../services/auth_service.dart';

class SignUpController extends ChangeNotifier {
  final AuthService _service;

  SignUpController(this._service);

  SignUpState _state = SignUpStateInitial();

  SignUpState get state => _state;

  void _changeState(SignUpState newState) {
    _state = newState;
    notifyListeners();
  }

  Future<void> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    _changeState(SignUpStateLoading());

    try {
      await _service.signUp(
        name: name,
        email: email,
        password: password,
      );

      _changeState(SignUpStateSuccess());
    } catch (error) {
      log(error.toString());
      _changeState(SignUpStateError(error.toString()));
    }
  }
}
