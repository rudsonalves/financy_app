import 'package:flutter/material.dart';

import '../../common/widgets/custom_text_form_field.dart';

class PasswordFormField extends StatefulWidget {
  const PasswordFormField({
    super.key,
    required this.labelText,
    this.hintText,
    this.helperText,
    this.keyboardType,
    this.controller,
    this.textInputAction,
    this.validator,
  });

  final String labelText;
  final String? hintText;
  final String? helperText;

  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;

  @override
  State<PasswordFormField> createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<PasswordFormField> {
  bool isHidden = true;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      validator: widget.validator,
      labelText: widget.labelText,
      hintText: widget.hintText,
      helperText: widget.helperText,
      controller: widget.controller,
      textInputAction: widget.textInputAction,
      obscureText: isHidden,
      suffixIcon: InkWell(
        borderRadius: BorderRadius.circular(25),
        child: Icon(isHidden ? Icons.visibility_off : Icons.visibility),
        onTap: () {
          setState(() {
            isHidden = !isHidden;
          });
        },
      ),
    );
  }
}
