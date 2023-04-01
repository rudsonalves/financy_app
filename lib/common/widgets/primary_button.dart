import 'package:flutter/material.dart';

import '../constants/app_button_styles.dart';
import '../constants/app_colors.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.title,
    required this.onTab,
  });

  final String title;
  final void Function() onTab;

  @override
  Widget build(BuildContext context) {
    final BorderRadius borderRadius = BorderRadius.circular(32);

    return Material(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 5, 20, 10),
        child: Ink(
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                color: AppColors.greenDark,
                offset: Offset(1, 3),
                blurRadius: 5,
                spreadRadius: .3,
              ),
            ],
            borderRadius: borderRadius,
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: AppColors.greenGradient,
            ),
          ),
          height: 64,
          child: InkWell(
            splashColor: AppColors.white,
            borderRadius: borderRadius,
            onTap: onTab,
            child: Align(
              alignment: Alignment.center,
              child: Text(
                title,
                style:
                    AppButtonStyles.smalText.copyWith(color: AppColors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
