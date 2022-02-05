import 'package:crypto_app/responsive/size_config.dart';
import 'package:crypto_app/screens/home/buy/buy_status_screen.dart';
import 'package:crypto_app/utils/colors.dart';
import 'package:crypto_app/utils/constants.dart';
import 'package:crypto_app/utils/url.dart';
import 'package:crypto_app/widget/labeled_checkbox.dart';
import 'package:crypto_app/widget/rounded_button.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class BuyScreen extends StatefulWidget {
  const BuyScreen({Key? key, required this.packName}) : super(key: key);
  final String packName;

  @override
  State<BuyScreen> createState() => _BuyScreenState();
}

class _BuyScreenState extends State<BuyScreen> {
  final List<String> genderItems = ['Prop firm', 'Stack firm', 'Autre firm'];

  bool _isSelected = false;
  bool _isSelected2 = false;
  bool _isLoading = false;
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DropdownButtonFormField2(
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(defaultRadius),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(defaultRadius),
                    borderSide: const BorderSide(
                      color: accentColor,
                    ),
                  ),
                ),
                isExpanded: true,
                hint: Text(
                  'Selectionner votre firm',
                  style: TextStyle(
                    fontSize: SizeConfig.heightMultiplier * 2,
                  ),
                ),
                icon: const Icon(
                  Icons.arrow_drop_down,
                  color: accentColor,
                ),
                iconSize: SizeConfig.heightMultiplier * 3,
                buttonHeight: 60,
                buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                dropdownDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                value: selectedValue,
                items: genderItems
                    .map((item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ))
                    .toList(),
                validator: (value) {
                  if (value == null) {
                    return 'Merci de sélection une firm.';
                  }
                },
                onChanged: (value) {
                  selectedValue = value.toString();
                },
                onSaved: (value) {
                  selectedValue = value.toString();
                },
              ),
              SizedBox(height: SizeConfig.heightMultiplier),
              LinkedLabelCheckbox(
                value: _isSelected,
                onChanged: (bool valide) {
                  setState(() {
                    _isSelected = valide;
                  });
                },
                url: termsAndCondition,
                text: "J'accepte les ",
                label: "termes et conditions",
              ),
              LinkedLabelCheckbox(
                value: _isSelected2,
                onChanged: (bool valide) {
                  setState(() {
                    _isSelected2 = valide;
                  });
                },
                url: refundPolicy,
                text: "J'accepte la ",
                label: "politique de remboursement",
              ),
              RoundedButton(
                text: "Poursuivre",
                onTap: () async {
                  if (_formKey.currentState!.validate() &&
                      _isSelected == true &&
                      _isSelected2 == true) {
                    setState(
                      () {
                        _isLoading = true;
                      },
                    );
                    _formKey.currentState!.save();

                    setState(
                      () {
                        _isLoading = false;
                      },
                    );
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BuyStatusScreen(
                          packName: widget.packName,
                          selectedValue: selectedValue!,
                        ),
                      ),
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
