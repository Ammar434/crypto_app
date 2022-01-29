import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:crypto_app/models/users.dart';
import 'package:crypto_app/providers/user_provider.dart';
import 'package:crypto_app/responsive/size_config.dart';
import 'package:crypto_app/utils/colors.dart';
import 'package:crypto_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import 'card_academy_presentation.dart';
import 'level_card.dart';

class AcademyHome extends StatefulWidget {
  const AcademyHome({Key? key}) : super(key: key);

  @override
  _AcademyHomeState createState() => _AcademyHomeState();
}

class _AcademyHomeState extends State<AcademyHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Academy Video",
        ),
      ),
      body: SizedBox(
        height: SizeConfig.heightMultiplier * 100,
        width: SizeConfig.widthMultiplier * 100,
        child: ListView(
          children: [
            CardAcademyPresentation(),
            Padding(
              padding: EdgeInsets.only(left: SizeConfig.widthMultiplier * 5),
              child: Text(
                "Mes formations accessible",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: SizeConfig.heightMultiplier * 2.5,
                ),
              ),
            ),
            Wrap(
              alignment: WrapAlignment.center,
              children: const [
                LevelCard(
                  levelId: 0,
                ),
                LevelCard(
                  levelId: 1,
                ),
                LevelCard(
                  levelId: 2,
                ),
                LevelCard(
                  levelId: 3,
                ),
                LevelCard(
                  levelId: 4,
                ),
                LevelCard(
                  levelId: 5,
                ),
                LevelCard(
                  levelId: 6,
                ),
                LevelCard(
                  levelId: 7,
                ),
                LevelCard(
                  levelId: 8,
                ),
                LevelCard(
                  levelId: 9,
                ),
                LevelCard(
                  levelId: 10,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
