import 'dart:async';

import 'package:crypto_app/models/payment_crypto_model.dart';
import 'package:crypto_app/responsive/size_config.dart';
import 'package:crypto_app/ressources/launch_url.dart';
import 'package:crypto_app/ressources/query_method.dart';
import 'package:crypto_app/screens/informations/information_screen.dart';
import 'package:crypto_app/services/payment/payment_crypto.dart';
import 'package:crypto_app/services/subscription/subscription.dart';
import 'package:crypto_app/widget/rounded_button.dart';
import 'package:flutter/material.dart';

class BuyStatusScreen extends StatefulWidget {
  const BuyStatusScreen({
    Key? key,
    required this.packName,
    required this.selectedValue,
    required this.packPrice,
    required this.daySubscriptionOffer,
  }) : super(key: key);

  final String packName;
  final String selectedValue;
  final String packPrice;
  final String daySubscriptionOffer;

  @override
  _BuyStatusScreenState createState() => _BuyStatusScreenState();
}

class _BuyStatusScreenState extends State<BuyStatusScreen> {
  final PaymentCrypto paymentCrypto = PaymentCrypto();
  PaymentCryptoModel? paymentCryptoModel;

  Future<void> updateData() async {
    await paymentCrypto.createOrder(widget.packPrice);
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
          await Subscription()
              .updateSubscription(int.parse(widget.daySubscriptionOffer));
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
        leading: IconButton(
          icon: Icon(Icons.adaptive.arrow_back),
          onPressed: () {
            Navigator.of(context)
              ..pop()
              ..pop();
          },
        ),
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
                        "Montant re??u en ${paymentCryptoModel?.receiveCurrency}",
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
