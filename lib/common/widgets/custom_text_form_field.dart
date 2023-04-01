import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    required this.labelText,
    this.hintText,
    this.helperText,
    this.textCapitalization,
    this.keyboardType,
    this.controller,
    this.textInputAction,
    this.suffixIcon,
    this.obscureText,
    this.validator,
  });

  final String labelText;
  final String? hintText;
  final String? helperText;
  final TextCapitalization? textCapitalization;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final Widget? suffixIcon;
  final bool? obscureText;
  final String? Function(String?)? validator;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  String? _helperText;

  @override
  void initState() {
    super.initState();
    _helperText = widget.helperText;
  }

  @override
  Widget build(BuildContext context) {
    const OutlineInputBorder defaultBorder = OutlineInputBorder(
      borderSide: BorderSide(
        color: AppColors.green,
      ),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        textCapitalization:
            widget.textCapitalization ?? TextCapitalization.none,
        keyboardType: widget.keyboardType,
        controller: widget.controller,
        textInputAction: widget.textInputAction,
        obscureText: widget.obscureText ?? false,
        validator: widget.validator,
        decoration: InputDecoration(
          hintStyle: AppTextStyles.inputText.copyWith(color: AppColors.green),
          suffixIcon: widget.suffixIcon,
          helperText: _helperText,
          // helperMaxLines: 1,
          helperStyle:
              AppTextStyles.baseSmallText.copyWith(color: AppColors.green),
          errorStyle: AppTextStyles.baseSmallText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelText: widget.labelText.toUpperCase(),
          hintText: widget.hintText,
          labelStyle: AppTextStyles.smalText.copyWith(color: AppColors.grey),
          border: defaultBorder,
          focusedBorder: defaultBorder,
          errorBorder: defaultBorder.copyWith(
            borderSide: const BorderSide(
              color: Colors.red,
            ),
          ),
          focusedErrorBorder: defaultBorder.copyWith(
            borderSide: const BorderSide(
              color: Colors.red,
            ),
          ),
          enabledBorder: defaultBorder,
          disabledBorder: defaultBorder,
        ),
        onChanged: (value) {
          if (value.length == 1) {
            setState(() {
              _helperText = null;
            });
          } else if (value.isEmpty) {
            setState(() {
              _helperText = widget.helperText;
            });
          }
        },
      ),
    );
  }
}
