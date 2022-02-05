import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:crypto_app/responsive/size_config.dart';
import 'package:crypto_app/ressources/launch_url.dart';
import 'package:crypto_app/utils/colors.dart';
import 'package:crypto_app/utils/constants.dart';
import 'package:crypto_app/utils/url.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CardAcademyIfUserSubscribe extends StatelessWidget {
  const CardAcademyIfUserSubscribe({
    Key? key,
    required this.dayLeft,
  }) : super(key: key);
  final String? dayLeft;
  @override
  Widget build(BuildContext context) {
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
          onTap: () {
            launchInBrowser(lifestyleAcademyPresentationVideo);
          },
          child: Padding(
            padding: EdgeInsets.all(SizeConfig.widthMultiplier * 5),
            child: Row(
              children: [
                Expanded(
                  child: Lottie.network(
                    "https://assets8.lottiefiles.com/temporary_files/PH5YkW.json",
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FittedBox(
                        child: Text(
                          "Profiter de l'Academy",
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
                          height: SizeConfig.heightMultiplier * 10,
                          child: AnimatedTextKit(
                            repeatForever: true,
                            animatedTexts: [
                              FadeAnimatedText('Il vous'),
                              FadeAnimatedText('Il vous reste'),
                              FadeAnimatedText(
                                  'Il vous reste ' + dayLeft! + " jours"),
                            ],
                          ),
                        ),
                      ),
                    ],
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
