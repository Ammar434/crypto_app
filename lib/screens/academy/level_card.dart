import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:crypto_app/models/users.dart';
import 'package:crypto_app/providers/user_provider.dart';
import 'package:crypto_app/responsive/size_config.dart';
import 'package:crypto_app/screens/academy/video_info.dart';
import 'package:crypto_app/utils/colors.dart';
import 'package:crypto_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class LevelCard extends StatelessWidget {
  const LevelCard({
    Key? key,
    required this.levelId,
  }) : super(key: key);
  final int levelId;
  @override
  Widget build(BuildContext context) {
    // User user = Provider.of<UserProvider>(context).getUser;
    bool _isAccessible = false;

    return InkWell(
      onTap: () {
        if (_isAccessible) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const VideoInfo(),
            ),
          );
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
              "Mini Groot",
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
