import 'package:crypto_app/responsive/size_config.dart';
import 'package:crypto_app/ressources/auth_method.dart';
import 'package:crypto_app/screens/authentication/auth_screen.dart';
import 'package:crypto_app/widget/rounded_button.dart';
import 'package:crypto_app/widget/snackbar_widget.dart';
import 'package:crypto_app/widget/text_field_input.dart';
import 'package:flutter/material.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  late TextEditingController password;
  late TextEditingController passwordConfirm;
  bool _isLoading = false;
  void changePassword() async {
    String res =
        await AuthMethods().updatePassword(password.text, passwordConfirm.text);
    if (res == "success") {
      AuthMethods().updatePassword(password.text, passwordConfirm.text);
      AuthMethods().signOut();
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const AuthScreen()),
        (Route<dynamic> route) => false,
      );
    } else {
      showSnackBar(context, res);
      password.clear();
      passwordConfirm.clear();
    }
  }

  @override
  void initState() {
    super.initState();
    password = TextEditingController();
    passwordConfirm = TextEditingController();
  }

  @override
  void dispose() {
    password.dispose();
    passwordConfirm.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text("Modifier votre mot de passe"),
      ),
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFieldInput(
              textEditingController: password,
              hintText: "Entrer votre nouveau mot de passe",
              textInputType: TextInputType.visiblePassword,
              isPassword: true,
            ),
            SizedBox(
              height: SizeConfig.heightMultiplier * 1,
            ),
            TextFieldInput(
              textEditingController: passwordConfirm,
              hintText: "Confirmer votre nouveau mot de passe",
              textInputType: TextInputType.visiblePassword,
              isPassword: true,
            ),
            SizedBox(
              height: SizeConfig.heightMultiplier * 5,
            ),
            RoundedButton(
              isLoading: _isLoading,
              onTap: () {
                setState(
                  () {
                    _isLoading = true;
                  },
                );
                changePassword();
                setState(
                  () {
                    _isLoading = false;
                  },
                );
              },
              text: "Confirmer",
            ),
          ],
        ),
      ),
    );
  }
}
