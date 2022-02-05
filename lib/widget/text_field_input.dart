import 'package:crypto_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldInput extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hintText;
  final TextInputType textInputType;
  final bool isPassword;
  const TextFieldInput({
    Key? key,
    required this.textEditingController,
    required this.hintText,
    required this.textInputType,
    this.isPassword = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final inputBorder = OutlineInputBorder(
      borderSide: Divider.createBorderSide(context),
    );

    return TextField(
      controller: textEditingController,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white38,
        border: inputBorder,
        hintText: hintText,
        focusedBorder: inputBorder,
        enabledBorder: inputBorder,
        hintStyle: const TextStyle(color: Colors.white),
        contentPadding: EdgeInsets.symmetric(
          vertical: defaultPadding * 1.2,
          horizontal: defaultPadding,
        ),
      ),
      keyboardType: textInputType,
      obscureText: isPassword,
    );
  }
}
