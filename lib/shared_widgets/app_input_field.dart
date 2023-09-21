import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppInputField extends StatelessWidget {
  final InputDecoration? decoration;
  final String hint;
  final String labeltext;
  final bool obscure;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  const AppInputField({
    super.key,
    this.decoration,
    this.hint = 'Enter username',
    this.labeltext = 'Username',
    this.onChanged,
    this.obscure = false,
    this.validator,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      obscureText: obscure,
      obscuringCharacter: '●',
      validator: validator,
      inputFormatters: inputFormatters,
      style: const TextStyle(color: Colors.white),
      decoration:
          decoration ?? InputDecoration(hintText: hint, labelText: labeltext),
    );
  }
}
