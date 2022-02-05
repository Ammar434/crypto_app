import 'package:crypto_app/utils/constants.dart';
import 'package:crypto_app/widget/text_field_input.dart';
import 'package:flutter/material.dart';

class SignUpForm extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController pwdController;
  final TextEditingController pwdConfirmController;
  final TextEditingController adressController;
  final TextEditingController numeroController;
  const SignUpForm(
      {Key? key,
      required this.emailController,
      required this.pwdController,
      required this.pwdConfirmController,
      required this.adressController,
      required this.numeroController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.13),
      child: Form(
        child: Column(
          children: [
            const Spacer(),
            TextFieldInput(
              isPassword: false,
              textEditingController: emailController,
              hintText: "Email",
              textInputType: TextInputType.emailAddress,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: defaultPadding),
              child: TextFieldInput(
                isPassword: true,
                textEditingController: pwdController,
                hintText: "Password",
                textInputType: TextInputType.visiblePassword,
              ),
            ),
            TextFieldInput(
              isPassword: true,
              textEditingController: pwdConfirmController,
              hintText: "Confirm Password",
              textInputType: TextInputType.visiblePassword,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: defaultPadding),
              child: TextFieldInput(
                isPassword: false,
                textEditingController: adressController,
                hintText: "Enter your adress",
                textInputType: TextInputType.streetAddress,
              ),
            ),
            TextFieldInput(
              isPassword: false,
              textEditingController: numeroController,
              hintText: "Enter your phone number",
              textInputType: TextInputType.phone,
            ),
            const Spacer(flex: 1)
          ],
        ),
      ),
    );
  }
}
