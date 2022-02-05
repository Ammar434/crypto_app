import 'package:crypto_app/responsive/size_config.dart';
import 'package:crypto_app/ressources/auth_method.dart';
import 'package:crypto_app/widget/rounded_button.dart';
import 'package:crypto_app/widget/snackbar_widget.dart';
import 'package:crypto_app/widget/text_field_input.dart';
import 'package:flutter/material.dart';

class ChangePhoneNumberScreen extends StatefulWidget {
  const ChangePhoneNumberScreen({Key? key}) : super(key: key);

  @override
  _ChangePhoneNumberScreenState createState() =>
      _ChangePhoneNumberScreenState();
}

class _ChangePhoneNumberScreenState extends State<ChangePhoneNumberScreen> {
  final TextEditingController phoneNumberController = TextEditingController();
  bool _isLoading = false;
  void changePhoneNumber() async {
    String res =
        await AuthMethods().updatePhoneNumber(phoneNumberController.text);
    if (res == "success") {
      showSnackBar(context, "Modification effectuée");
    } else {
      showSnackBar(context, res);
    }
    phoneNumberController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text("Modifier votre numéro"),
      ),
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFieldInput(
              textEditingController: phoneNumberController,
              hintText: "Entrer votre nouveau numéro",
              textInputType: TextInputType.phone,
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
                changePhoneNumber();
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
