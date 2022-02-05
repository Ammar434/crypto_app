import 'package:crypto_app/responsive/size_config.dart';
import 'package:crypto_app/ressources/auth_method.dart';
import 'package:crypto_app/utils/colors.dart';
import 'package:crypto_app/utils/constants.dart';
import 'package:crypto_app/widget/rounded_button.dart';
import 'package:crypto_app/widget/snackbar_widget.dart';
import 'package:crypto_app/widget/text_field_input.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  late final TextEditingController textEditingController;
  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  final String textSnackBar =
      "Si nous trouvons votre compte vous recevrez un e-mail qui vous permettra de réinitialiser votre mot de passe";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Mot de passe oublié?",
              style: TextStyle(
                color: textColor,
                fontSize: SizeConfig.heightMultiplier * 2.5,
              ),
            ),
            SizedBox(
              height: SizeConfig.heightMultiplier * 3,
            ),
            TextFieldInput(
              textEditingController: textEditingController,
              hintText: "Entrer votre email",
              textInputType: TextInputType.emailAddress,
              isPassword: false,
            ),
            SizedBox(
              height: SizeConfig.heightMultiplier * 3,
            ),
            RoundedButton(
              onTap: () {
                AuthMethods().resetPassword(
                  textEditingController.text,
                );
                showSnackBar(context, textSnackBar);
                Navigator.pop(context);
              },
              text: "Confirmer",
            )
          ],
        ),
      ),
    );
  }
}
