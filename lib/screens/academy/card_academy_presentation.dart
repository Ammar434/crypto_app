import 'package:flutter/material.dart';

import 'card_academy_if_user_not_subscribe.dart';
import 'card_academy_if_user_subscribe.dart';

class CardAcademyPresentation extends StatelessWidget {
  const CardAcademyPresentation({
    Key? key,
    required this.dayLeft,
  }) : super(key: key);
  final int dayLeft;
  @override
  Widget build(BuildContext context) {
    if (dayLeft < 0) {
      return const CardAcademyIfUserNotSubscribe();
    }
    return CardAcademyIfUserSubscribe(
      dayLeft: dayLeft.toString(),
    );
  }
}
