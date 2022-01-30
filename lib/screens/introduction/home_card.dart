import 'package:crypto_app/responsive/size_config.dart';
import 'package:crypto_app/utils/constants.dart';
import 'package:crypto_app/utils/introduction_card.dart';
import 'package:flutter/material.dart';

class HomeCard extends StatelessWidget {
  final int index;
  final Color color;
  const HomeCard({
    Key? key,
    required this.index,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 250,
          margin: EdgeInsets.symmetric(horizontal: defaultPadding * 3),
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(defaultRadius),
            ),
            //color: thirdColor,
          ),
          child: Image.asset(introductionCardList[index].image),
        ),
        SizedBox(
          height: defaultPadding,
        ),
        Text(
          introductionCardList[index].text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: SizeConfig.heightMultiplier * 2,
            color: color,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
