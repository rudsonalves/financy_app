import 'dart:developer';

import 'package:financy_app/common/constants/app_colors.dart';
import 'package:financy_app/features/sign_up/sign_up_state.dart';
import 'package:financy_app/services/mock_auth_servide.dart';
import 'package:flutter/material.dart';

import '../../common/widgets/simple_message_dialog.dart';
import '../../features/sign_up/sign_up_controller.dart';
import '../../common/widgets/custom_text_form_field.dart';
import '../../common/widgets/custom_text_button.dart';
import '../../common/widgets/password_form_field.dart';
import '../../common/widgets/primary_button.dart';
import '../../common/widgets/title_text.dart';
import '../../common/utils/validator.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  static const routeName = '/account';

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final SignUpController _controller = SignUpController(MockAuthService());

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() async {
      if (_controller.state is SignUpLoadingState) {
        showDialog(
          context: context,
          builder: (context) => const Center(
            child: CircularProgressIndicator(
              color: AppColors.green,
            ),
          ),
        );
      }
      if (_controller.state is SignUpSucessState) {
        Navigator.of(context).pop();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const Scaffold(
                body: Center(
                  child: Text('New Page'),
                ),
              );
            },
          ),
        );
      }

      if (_controller.state is SignUpErrorState) {
        final error = _controller.state as SignUpErrorState;
        Navigator.of(context).pop();
        await simpleMessageDialog(
          context: context,
          title: 'Login Error',
          message: error.message,
          icon: Icons.error,
        );
      }
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          const TitleTex(texts: ['Start Saving', 'Your Money!']),
          Image.asset(
            'assets/images/account.png',
            height: 180,
          ),
          //
          Form(
            key: _formKey,
            child: Column(
              children: [
                CustomTextFormField(
                  controller: _nameController,
                  labelText: 'Your Name',
                  hintText: 'Your Name',
                  textCapitalization: TextCapitalization.words,
                  textInputAction: TextInputAction.next,
                  validator: Validator.validateName,
                ),
                CustomTextFormField(
                  controller: _emailController,
                  labelText: 'Your Email',
                  hintText: '<your name>@email.com',
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  validator: Validator.validateEmail,
                ),
                PasswordFormField(
                  controller: _passwordController,
                  labelText: 'Choose Your Password',
                  helperText:
                      'Must have at least 8 characters, 1 capital letter and 1 number.',
                  hintText: '*********',
                  textInputAction: TextInputAction.next,
                  validator: Validator.validatePassword,
                ),
                PasswordFormField(
                  labelText: 'Confirm Your Password',
                  hintText: '*********',
                  textInputAction: TextInputAction.done,
                  validator: (value) => Validator.validateConfirmPassword(
                      _passwordController.text, value!),
                ),
              ],
            ),
          ),
          PrimaryButton(
            title: 'Sign Up',
            onTab: () async {
              final valit = _formKey.currentState != null &&
                  _formKey.currentState!.validate();

              if (valit) {
                await _controller.signUp(
                  name: _nameController.text,
                  email: _emailController.text,
                  password: _passwordController.text,
                );
              } else {
                log('Erro ao logar!');
              }
            },
          ),
          CustomTextButton(
            fistMessage: 'Already have account?',
            secMessage: 'Sign in',
            onPressed: () {
              log('Login message');
            },
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
