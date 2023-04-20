import 'dart:developer';

import 'package:financy_app/locator.dart';
import 'package:flutter/material.dart';

import '../../common/constants/app_routes.dart';
import '../../common/constants/app_colors.dart';
import '../../common/widgets/simple_message_dialog.dart';
import '../../common/widgets/custom_text_form_field.dart';
import '../../common/widgets/custom_text_button.dart';
import '../../common/widgets/password_form_field.dart';
import '../../common/widgets/primary_button.dart';
import '../../common/widgets/title_text.dart';
import '../../common/utils/sign_validator.dart';
import './sign_in_controller.dart';
import './sign_ip_state.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final SignInController _controller = locator.get<SignInController>();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() async {
      if (_controller.state is SignInStateLoading) {
        showDialog(
          context: context,
          builder: (context) => const Center(
            child: CircularProgressIndicator(
              color: AppColors.green,
            ),
          ),
        );
      }
      if (_controller.state is SignInStateSuccess) {
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

      if (_controller.state is SignInStateError) {
        final error = _controller.state as SignInStateError;
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
          const TitleTex(texts: ['', 'Welcome Back!']),
          Image.asset(
            'assets/images/sign_in.png',
            height: 180,
          ),
          //
          Form(
            key: _formKey,
            child: Column(
              children: [
                CustomTextFormField(
                  controller: _emailController,
                  labelText: 'Your Email',
                  hintText: '<your name>@email.com',
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  validator: SignValidator.validateEmail,
                ),
                PasswordFormField(
                  controller: _passwordController,
                  labelText: 'Your Password',
                  helperText:
                      'Must have at least 8 characters, 1 capital letter and 1 number.',
                  hintText: '*********',
                  textInputAction: TextInputAction.next,
                  validator: SignValidator.validatePassword,
                ),
                const SizedBox(height: 142),
              ],
            ),
          ),
          PrimaryButton(
            title: 'Sign In',
            onTab: () async {
              final valit = _formKey.currentState != null &&
                  _formKey.currentState!.validate();

              if (valit) {
                await _controller.signIn(
                  email: _emailController.text,
                  password: _passwordController.text,
                );
              } else {
                log('Erro ao logar!');
              }
            },
          ),
          CustomTextButton(
              fistMessage: 'Don\'t have account?',
              secMessage: 'Sign Up',
              onPressed: () {
                Navigator.of(context).popAndPushNamed(AppRoute.signUpPage);
              }),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
