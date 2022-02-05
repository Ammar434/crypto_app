import 'package:crypto_app/responsive/size_config.dart';
import 'package:crypto_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialRow extends StatelessWidget {
  const SocialRow({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final double iconSize = SizeConfig.heightMultiplier * 5;
    return Padding(
      padding: EdgeInsets.only(left: SizeConfig.heightMultiplier * 1),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.all(defaultPadding),
            child: FaIcon(
              FontAwesomeIcons.instagram,
              color: Colors.red,
              size: iconSize,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(defaultPadding),
            child: FaIcon(
              FontAwesomeIcons.telegram,
              color: const Color(0xFF2AABEE),
              size: iconSize,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(defaultPadding),
            child: FaIcon(
              FontAwesomeIcons.discord,
              color: const Color(0xFF7289da),
              size: iconSize,
            ),
          ),
        ],
      ),
    );
  }
}
