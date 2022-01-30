import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:crypto_app/responsive/size_config.dart';
import 'package:crypto_app/utils/colors.dart';
import 'package:crypto_app/utils/constants.dart';
import 'package:crypto_app/utils/url.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

class CardAcademyPresentation extends StatelessWidget {
  const CardAcademyPresentation({
    Key? key,
  }) : super(key: key);
  Future<void> _launchInBrowser(String url) async {
    if (!await launch(url)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        debugPrint("dfgdfsd");

        _launchInBrowser(lifestyleAcademyPresentationVideo);
      },
      child: Container(
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
        child: Padding(
          padding: EdgeInsets.all(SizeConfig.widthMultiplier * 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FittedBox(
                child: Text(
                  "Decouvrir l'Academy",
                  style: TextStyle(
                    fontSize: SizeConfig.heightMultiplier * 3,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(
                height: defaultPadding / 2,
              ),
              DefaultTextStyle(
                style: TextStyle(
                  fontSize: SizeConfig.heightMultiplier * 3,
                  color: Colors.white,
                  shadows: const [
                    Shadow(
                      blurRadius: 2.0,
                      color: Colors.white,
                      offset: Offset(0, 0),
                    ),
                  ],
                ),
                child: SizedBox(
                  height: SizeConfig.heightMultiplier * 5,
                  child: AnimatedTextKit(
                    repeatForever: true,
                    animatedTexts: [
                      FadeAnimatedText('Texte '),
                      FadeAnimatedText('Texte a rajouter!!'),
                      FadeAnimatedText('Texte a  rajouter !!!'),
                    ],
                  ),
                ),
              ),
              Row(
                children: [
                  Flexible(child: Container()),
                  SizedBox(
                    width: SizeConfig.widthMultiplier * 20,
                    height: SizeConfig.widthMultiplier * 20,
                    child: Lottie.network(
                      "https://assets9.lottiefiles.com/packages/lf20_zq1epbqc.json",
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
