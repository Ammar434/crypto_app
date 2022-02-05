import 'package:crypto_app/responsive/size_config.dart';
import 'package:crypto_app/ressources/auth_method.dart';
import 'package:crypto_app/widget/rounded_button.dart';
import 'package:crypto_app/widget/snackbar_widget.dart';
import 'package:crypto_app/widget/text_field_input.dart';
import 'package:flutter/material.dart';

class ChangeAddressScreen extends StatefulWidget {
  const ChangeAddressScreen({Key? key}) : super(key: key);

  @override
  _ChangeAddressScreenState createState() => _ChangeAddressScreenState();
}

class _ChangeAddressScreenState extends State<ChangeAddressScreen> {
  final TextEditingController addressController = TextEditingController();
  bool _isLoading = false;
  void changeAddress() async {
    String res = await AuthMethods().updateAddress(addressController.text);
    if (res == "success") {
      showSnackBar(context, "Modification effectuée");
    } else {
      showSnackBar(context, res);
    }
    addressController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text("Modifier votre adresse"),
      ),
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFieldInput(
              textEditingController: addressController,
              hintText: "Entrer votre nouvelle adresse",
              textInputType: TextInputType.streetAddress,
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
                changeAddress();
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
