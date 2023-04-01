import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.fistMessage,
    required this.secMessage,
    required this.onPressed,
  });

  final String fistMessage;
  final String secMessage;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          fistMessage,
          style: AppTextStyles.smalText.copyWith(color: AppColors.grey),
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            secMessage,
            style: AppTextStyles.smalText.copyWith(color: AppColors.green),
          ),
        ),
      ],
    );
  }
}
