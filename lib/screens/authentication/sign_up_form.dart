import 'package:crypto_app/utils/constants.dart';
import 'package:flutter/material.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.13),
      child: Form(
        child: Column(
          children: [
            const Spacer(),
            TextFormField(
              decoration: const InputDecoration(
                hintText: "Email",
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: defaultPadding),
              child: TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: "Password",
                ),
              ),
            ),
            TextFormField(
              obscureText: true,
              decoration: const InputDecoration(
                hintText: "Confirm Password",
              ),
            ),
            const Spacer(flex: 2)
          ],
        ),
      ),
    );
  }
}
