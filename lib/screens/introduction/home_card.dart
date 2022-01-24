import 'package:crypto_app/utils/constants.dart';
import 'package:crypto_app/utils/introduction_card.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomeCard extends StatelessWidget {
  final int index;
  const HomeCard({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(
          height: 200,
        ),
        Container(
          height: 250,
          margin: EdgeInsets.symmetric(horizontal: defaultPadding * 3),
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(defaultRadius),
            ),
            //color: thirdColor,
          ),
          child: Lottie.network(introductionCardList[index].image),
        ),
        SizedBox(
          height: defaultPadding,
        ),
        Text(
          introductionCardList[index].text,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
