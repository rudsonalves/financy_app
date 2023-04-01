import 'package:flutter/material.dart';

import '../../common/constants/app_text_styles.dart';
import '../../common/constants/app_colors.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  static const routeName = '/splash';

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
        child: Text(
          'financy',
          style: AppTextStyles.bigText.copyWith(color: AppColors.white),
        ),
      ),
    );
  }
}
