import 'dart:developer';

import 'package:flutter/material.dart';

import '../../common/constants/app_routes.dart';
import '../../common/constants/app_text_styles.dart';
import '../../common/constants/app_colors.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    initOnboardingPage();
    log('Starting...');
  }

  Future<void> initOnboardingPage() async {
    final navigator = Navigator.of(context);
    await Future.delayed(const Duration(seconds: 2));
    navigator.pushReplacementNamed(AppRoute.initialPage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: AppColors.greenGradient,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'financy',
              style: AppTextStyles.bigText.copyWith(color: AppColors.white),
            ),
            const SizedBox(height: 60),
            const Center(child: CircularProgressIndicator(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
