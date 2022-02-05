import 'package:crypto_app/responsive/size_config.dart';
import 'package:crypto_app/ressources/launch_url.dart';
import 'package:crypto_app/screens/home/buy/buy_screen.dart';
import 'package:crypto_app/utils/cards.dart';
import 'package:crypto_app/utils/colors.dart';
import 'package:crypto_app/utils/url.dart';
import 'package:crypto_app/widget/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'card_3d_details_tiles.dart';
import 'card_3d_widget.dart';

class CardsDetails extends StatelessWidget {
  final Card3d card;
  const CardsDetails({Key? key, required this.card}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          GestureDetector(
            onTap: () {
              launchInBrowser(lifestyleAcademyPresentationVideo);
            },
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: SizeConfig.heightMultiplier * 2,
                  horizontal: SizeConfig.widthMultiplier * 2),
              child: const FaIcon(FontAwesomeIcons.infoCircle),
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              SizedBox(
                height: size.height * 0.05,
              ),
              Align(
                child: SizedBox(
                  height: size.width / 2,
                  width: size.width / 2,
                  child: Hero(
                    tag: card.title,
                    child: Card3dWidget(card: card),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                card.title,
                style: TextStyle(
                  color: accentColor,
                  fontWeight: FontWeight.bold,
                  fontSize: size.height / 30,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "${card.price} €",
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                  fontSize: size.height / 45,
                ),
              ),
            ],
          ),
          Expanded(
            child: Card3DDetailsTiles(card: card),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width / 5),
            child: RoundedButton(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BuyScreen(
                      packName: card.title,
                    ),
                  ),
                );
              },
              text: "Acheter",
            ),
          )
        ],
      ),
    );
  }
}
