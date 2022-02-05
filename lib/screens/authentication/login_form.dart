import 'package:crypto_app/screens/authentication/forgot_password_screen.dart';
import 'package:crypto_app/widget/text_field_input.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  const LoginForm(
      {Key? key, required this.emailController, required this.pwdController})
      : super(key: key);

  final TextEditingController emailController;

  final TextEditingController pwdController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.13),
      child: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            TextFieldInput(
              textEditingController: emailController,
              hintText: "Email",
              textInputType: TextInputType.emailAddress,
              isPassword: false,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: TextFieldInput(
                textEditingController: pwdController,
                hintText: 'Password',
                textInputType: TextInputType.text,
                isPassword: true,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ForgotPasswordScreen(),
                  ),
                );
              },
              child: Text(
                "Mot de passe oublié?",
                style: Theme.of(context).textTheme.headline2,
              ),
            ),
            const Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
