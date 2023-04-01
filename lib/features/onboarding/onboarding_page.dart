import 'dart:developer';

import 'package:flutter/material.dart';

import '../../common/widgets/custom_text_button.dart';
import '../../common/widgets/title_text.dart';
import '../../common/widgets/primary_button.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  static const routeName = '/onboarding';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: Image.asset('assets/images/man2.png'),
          ),
          const TitleTex(texts: ['Spend Smarter', 'Save More']),
          PrimaryButton(
            title: 'Get Started',
            onTab: () {
              log('Pressed!');
            },
          ),
          CustomTextButton(
            fistMessage: 'Already have account?',
            secMessage: 'Log In',
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
