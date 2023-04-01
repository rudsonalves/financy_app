import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';

class TitleTex extends StatelessWidget {
  const TitleTex({super.key, required this.texts});

  final List<String> texts;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: texts
          .map(
            (text) => Text(
              text,
              style: AppTextStyles.mediumText.copyWith(color: AppColors.green),
            ),
          )
          .toList(),
    );
  }
}
