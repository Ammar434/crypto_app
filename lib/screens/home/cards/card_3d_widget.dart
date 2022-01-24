import 'package:crypto_app/utils/cards.dart';
import 'package:flutter/material.dart';

class Card3dWidget extends StatelessWidget {
  const Card3dWidget({
    Key? key,
    required this.card,
  }) : super(key: key);

  final Card3d card;

  @override
  Widget build(BuildContext context) {
    final BorderRadius border = BorderRadius.circular(15);

    return PhysicalModel(
      color: Colors.white,
      elevation: 10,
      borderRadius: border,
      child: ClipRRect(
        borderRadius: border,
        child: Image.asset(
          card.image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
