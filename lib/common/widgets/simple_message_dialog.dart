import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

Future<dynamic> simpleMessageDialog({
  required BuildContext context,
  String title = '',
  String message = '',
  IconData icon = Icons.warning,
}) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: AppColors.greenVeryLight,
      shape: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      title: Text(title),
      icon: Icon(
        icon,
        size: 60.0,
      ),
      iconColor: Theme.of(context).colorScheme.error,
      content: Text(
        message,
        textAlign: TextAlign.center,
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text(
            'Close',
            style: TextStyle(color: AppColors.green),
          ),
        ),
      ],
    ),
  );
}
