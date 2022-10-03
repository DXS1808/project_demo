import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../config/constants.dart';

class InputTextWrap extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final Widget icon;
  final Widget? iconSuffix;
  final bool obscureText;
  final String? Function(String?) validator;
  final List<TextInputFormatter>? inputFormatters;
  final Color? colors;

  const InputTextWrap(
      {super.key,
      required this.label,
      required this.controller,
      required this.icon,
      required this.validator,
      this.iconSuffix,
      this.inputFormatters,
      this.colors,
      required this.obscureText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: inputFormatters,
      controller: controller,
      obscureText: obscureText,
      onFieldSubmitted: (value) {
        if (value.isNotEmpty) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(15.0),
          labelStyle:
              const TextStyle(color: Constants.background, fontSize: 14),
          labelText: label,
          prefixIcon: icon,
          fillColor: Colors.white,
          filled: true,
          suffixIcon: iconSuffix,
          focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(20.0)),
            borderSide:
                BorderSide(color: colors ?? Constants.background, width: 1.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(20.0)),
            borderSide:
                BorderSide(color: colors ?? Constants.background, width: 1.0),
          ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            borderSide: BorderSide(
              color: Constants.background,
            ),
          )),
      validator: validator,
    );
  }
}
