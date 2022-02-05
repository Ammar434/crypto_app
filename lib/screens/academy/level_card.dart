import 'package:crypto_app/responsive/size_config.dart';
import 'package:crypto_app/screens/academy/video_info.dart';
import 'package:crypto_app/utils/colors.dart';
import 'package:crypto_app/utils/constants.dart';
import 'package:crypto_app/widget/snackbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LevelCard extends StatelessWidget {
  const LevelCard({
    Key? key,
    required this.levelId,
    required this.dayLeft,
    required this.userLevel,
    required this.levelName,
  }) : super(key: key);
  final int levelId;
  final int dayLeft;
  final int userLevel;
  final String levelName;

  @override
  Widget build(BuildContext context) {
    bool _isAccessible = false;
    if (userLevel >= levelId && dayLeft >= 0) {
      _isAccessible = true;
    }

    return InkWell(
      onTap: () {
        if (dayLeft < 0) {
          showSnackBar(context, "Aucun abonnement trouvé");
        } else if (_isAccessible) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => VideoInfo(level: levelId),
            ),
          );
        } else {
          showSnackBar(context,
              "Niveau non débloqué veuillez prendre conctact avec notre équipe");
        }
      },
      child: Container(
        width: SizeConfig.widthMultiplier * 40,
        height: SizeConfig.widthMultiplier * 40,
        margin: EdgeInsets.all(SizeConfig.widthMultiplier * 2),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(defaultPadding),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FaIcon(
              _isAccessible
                  ? FontAwesomeIcons.unlockAlt
                  : FontAwesomeIcons.lock,
              color: accentColor,
              size: SizeConfig.widthMultiplier * 10,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              levelId.toString(),
              style: TextStyle(
                color: accentColor,
                fontSize: SizeConfig.heightMultiplier * 3,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              levelName,
              style: TextStyle(
                color: accentColor,
                fontSize: SizeConfig.heightMultiplier * 2,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
