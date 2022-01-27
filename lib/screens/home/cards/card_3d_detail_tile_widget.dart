import 'package:crypto_app/responsive/size_config.dart';
import 'package:crypto_app/utils/cards.dart';
import 'package:crypto_app/utils/colors.dart';
import 'package:flutter/material.dart';

class Card3dDetailTileWidget extends StatelessWidget {
  const Card3dDetailTileWidget({
    Key? key,
    required this.text1,
    this.optionalText = "",
    required this.text2,
  }) : super(key: key);

  final String text1;
  final String text2;
  final String optionalText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Icon(
            Icons.star,
            color: accentColor,
            size: SizeConfig.heightMultiplier * 4,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    text1,
                    style: TextStyle(
                        fontSize: SizeConfig.heightMultiplier * 2.2,
                        fontWeight: FontWeight.bold,
                        color: primaryColor),
                  ),
                  Text(
                    text2,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: accentColor),
                  ),
                ],
              ),
              if (optionalText.isNotEmpty)
                SizedBox(
                  width: SizeConfig.widthMultiplier * 70,
                  child: Text(
                    optionalText,
                    maxLines: 3,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: SizeConfig.heightMultiplier * 1.9),
                  ),
                ),
            ],
          )
        ],
      ),
    );
  }
}
