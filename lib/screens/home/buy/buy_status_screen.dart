import 'dart:async';

import 'package:crypto_app/models/payment_crypto_model.dart';
import 'package:crypto_app/responsive/size_config.dart';
import 'package:crypto_app/ressources/launch_url.dart';
import 'package:crypto_app/ressources/query_method.dart';
import 'package:crypto_app/screens/informations/information_screen.dart';
import 'package:crypto_app/services/payment/payment_crypto.dart';
import 'package:crypto_app/widget/rounded_button.dart';
import 'package:flutter/material.dart';

class BuyStatusScreen extends StatefulWidget {
  const BuyStatusScreen(
      {Key? key, required this.packName, required this.selectedValue})
      : super(key: key);

  final String packName;
  final String selectedValue;

  @override
  _BuyStatusScreenState createState() => _BuyStatusScreenState();
}

class _BuyStatusScreenState extends State<BuyStatusScreen> {
  final PaymentCrypto paymentCrypto = PaymentCrypto();
  PaymentCryptoModel? paymentCryptoModel;

  Future<void> updateData() async {
    await paymentCrypto.createOrder();
    paymentCryptoModel = (await paymentCrypto.getOrderStatus())!;
    Timer.periodic(
      const Duration(seconds: 10),
      (timer) async {
        paymentCryptoModel = (await paymentCrypto.getOrderStatus())!;
        setState(
          () {},
        );
        if (paymentCryptoModel?.status == "paid") {
          timer.cancel();

          await QueryFromFirebase().updatePropFirm(
            widget.packName,
            widget.selectedValue,
            paymentCryptoModel!.id.toString(),
          );
          await QueryFromFirebase().updateUserNumberPackBuy();
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    updateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 10),
        child: paymentCryptoModel == null
            ? const Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  InformationTileWidget(
                    title: 'Id du paiement',
                    text: paymentCryptoModel!.id.toString(),
                  ),
                  InformationTileWidget(
                    title: "Montant en ${paymentCryptoModel?.priceCurrency}",
                    text: paymentCryptoModel!.priceAmount,
                  ),
                  InformationTileWidget(
                    title:
                        "Montant reçu en ${paymentCryptoModel?.receive_currency}",
                    text: paymentCryptoModel!.receiveAmount,
                  ),
                  InformationTileWidget(
                    title: "Status",
                    text: paymentCryptoModel!.status,
                  ),
                  RoundedButton(
                    text: "Lien vers le paiement",
                    onTap: () {
                      launchInBrowser(paymentCryptoModel!.paymentUrl);
                    },
                  ),
                ],
              ),
      ),
    );
  }
}
