import 'package:crypto_app/models/users.dart';
import 'package:crypto_app/providers/user_provider.dart';
import 'package:crypto_app/responsive/size_config.dart';
import 'package:flutter/material.dart';
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
    User user = Provider.of<UserProvider>(context).getUser;
    int dayLeft = user.dayLeft;
    int userLevel = int.parse(user.level);
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
            CardAcademyPresentation(
              dayLeft: dayLeft,
            ),
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
              children: [
                LevelCard(
                  levelId: 0,
                  dayLeft: dayLeft,
                  userLevel: userLevel,
                  levelName: "Mini Groot",
                ),
                LevelCard(
                  levelId: 0,
                  dayLeft: dayLeft,
                  userLevel: userLevel,
                  levelName: "Mini Groot",
                ),
                LevelCard(
                  levelId: 0,
                  dayLeft: dayLeft,
                  userLevel: userLevel,
                  levelName: "Mini Groot",
                ),
                LevelCard(
                  levelId: 0,
                  dayLeft: dayLeft,
                  userLevel: userLevel,
                  levelName: "Mini Groot",
                ),
                LevelCard(
                  levelId: 0,
                  dayLeft: dayLeft,
                  userLevel: userLevel,
                  levelName: "Mini Groot",
                ),
                LevelCard(
                  levelId: 0,
                  dayLeft: dayLeft,
                  userLevel: userLevel,
                  levelName: "Mini Groot",
                ),
                LevelCard(
                  levelId: 0,
                  dayLeft: dayLeft,
                  userLevel: userLevel,
                  levelName: "Mini Groot",
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
