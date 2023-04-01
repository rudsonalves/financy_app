import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

final defaultTheme = ThemeData(
  // useMaterial3: true,
  inputDecorationTheme: const InputDecorationTheme(
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: AppColors.green,
      ),
    ),
  ),
);
