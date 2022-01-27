import 'package:crypto_app/utils/constants.dart';
import 'package:flutter/material.dart';

class TextFieldInput extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool isPass;
  final String hintText;
  final TextInputType textInputType;
  final bool isSignUp;
  const TextFieldInput({
    Key? key,
    required this.textEditingController,
    this.isPass = false,
    required this.hintText,
    required this.textInputType,
    required this.isSignUp,
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
        fillColor: isSignUp ? Colors.black26 : Colors.white38,
        border: inputBorder,
        hintText: hintText,
        focusedBorder: inputBorder,
        enabledBorder: inputBorder,
        hintStyle: TextStyle(color: isSignUp ? Colors.white : Colors.white),
        contentPadding: EdgeInsets.symmetric(
          vertical: defaultPadding * 1.2,
          horizontal: defaultPadding,
        ),
      ),
      keyboardType: textInputType,
      obscureText: isPass,
    );
  }
}
