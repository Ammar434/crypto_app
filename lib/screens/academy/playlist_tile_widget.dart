import 'package:crypto_app/models/video_model.dart';
import 'package:crypto_app/responsive/size_config.dart';
import 'package:crypto_app/utils/colors.dart';
import 'package:crypto_app/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PlaylistTileWidget extends StatelessWidget {
  const PlaylistTileWidget({
    Key? key,
    required this.videoModel,
    required this.onTap,
  }) : super(key: key);

  final VideoModel videoModel;
  final GestureTapCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            width: SizeConfig.widthMultiplier * 25,
            height: SizeConfig.widthMultiplier * 25,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(defaultRadius),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  videoModel.thumbnail,
                ),
              ),
            ),
            child: Center(
              child: FaIcon(
                FontAwesomeIcons.solidPlayCircle,
                size: SizeConfig.widthMultiplier * 8,
                color: textColor,
              ),
            ),
          ),
        ),
        SizedBox(
          width: SizeConfig.widthMultiplier * 5,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              videoModel.title,
              style: TextStyle(
                  color: backgroundColor,
                  fontWeight: FontWeight.w600,
                  fontSize: SizeConfig.heightMultiplier * 2.2),
            ),
            Text(
              videoModel.time,
              style: const TextStyle(
                color: hintColor,
              ),
            ),
            Text(
              videoModel.description,
              style: const TextStyle(
                color: hintColor,
              ),
            ),
          ],
        )
      ],
    );
  }
}
