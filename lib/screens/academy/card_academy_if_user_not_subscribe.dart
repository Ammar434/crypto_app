import 'package:crypto_app/responsive/size_config.dart';
import 'package:crypto_app/screens/academy/academy_buy_subscription.dart';
import 'package:crypto_app/utils/colors.dart';
import 'package:crypto_app/utils/constants.dart';
import 'package:crypto_app/widget/snackbar_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CardAcademyIfUserNotSubscribe extends StatelessWidget {
  const CardAcademyIfUserNotSubscribe({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void onTap() {
      if (kIsWeb) {
        showSnackBar(context,
            "Nous ne prennons pas d'abonnement sur cette application.");
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const AcademyBuySubscription(),
          ),
        );
      }
    }

    return Container(
      margin: EdgeInsets.all(defaultPadding),
      height: SizeConfig.heightMultiplier * 30,
      decoration: BoxDecoration(
        color: accentColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(SizeConfig.widthMultiplier * 3),
          bottomRight: Radius.circular(SizeConfig.widthMultiplier * 3),
          topLeft: Radius.circular(SizeConfig.widthMultiplier * 3),
          topRight: Radius.circular(
            SizeConfig.widthMultiplier * 15,
          ),
        ),
        boxShadow: const [
          BoxShadow(
            offset: Offset(1, 1),
            blurRadius: 4,
            color: accentColor,
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(SizeConfig.widthMultiplier * 3),
          bottomRight: Radius.circular(SizeConfig.widthMultiplier * 3),
          topLeft: Radius.circular(SizeConfig.widthMultiplier * 3),
          topRight: Radius.circular(
            SizeConfig.widthMultiplier * 15,
          ),
        ),
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: EdgeInsets.all(SizeConfig.widthMultiplier * 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FittedBox(
                  child: Text(
                    "Aucun abonnement",
                    style: TextStyle(
                      fontSize: SizeConfig.heightMultiplier * 3,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(
                  width: SizeConfig.widthMultiplier * 40,
                  height: SizeConfig.widthMultiplier * 30,
                  child: Lottie.network(
                    "https://assets9.lottiefiles.com/packages/lf20_bGcAek.json",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
