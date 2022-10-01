import 'package:fkrni/core/const/app_radius.dart';
import 'package:flutter/material.dart';

class DefaultTextFiled extends StatelessWidget {
  final TextEditingController controller;
  final int maxLine;
  final String labelText;
  final Widget suffixIcon;
  final Widget prefixIcon;
  final TextStyle labelStyle;
  final TextInputType keyboardType;
  final TextDirection textDirection;
  final double radius;
  final bool obscureText;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onSubmit;

  const DefaultTextFiled(
      {super.key,
      required this.controller,
      this.maxLine = 1,
      required this.labelText,
      this.suffixIcon = const SizedBox.shrink(),
      this.prefixIcon = const SizedBox.shrink(),
      required this.labelStyle,
      this.keyboardType = TextInputType.text,
      this.textDirection = TextDirection.ltr,
      this.radius = AppRadius.ra10,
      this.obscureText = false,
      this.onChanged,
      this.validator,
      this.onSubmit});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: Theme.of(context).primaryColor,
      maxLines: maxLine,
      textDirection: textDirection,
      style: Theme.of(context).textTheme.bodyText1,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        contentPadding: const EdgeInsetsDirectional.all(20),
        labelText: labelText,
        labelStyle: labelStyle,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: const BorderSide(
            color: Colors.grey,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: const BorderSide(
            color: Colors.grey,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
      obscureText: obscureText,
      onChanged: onChanged,
      validator: validator,
      onFieldSubmitted: onSubmit,
    );
  }
}
