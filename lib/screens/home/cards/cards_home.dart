import 'package:crypto_app/utils/constants.dart';
import 'package:flutter/material.dart';

import 'card_horizontal.dart';
import 'cards_body.dart';

class CardsHome extends StatelessWidget {
  final GestureTapCallback onTap;
  const CardsHome({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black87),
        title: const Text(
          "Lifestyle Academy",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black87,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: onTap,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: defaultPadding * 5),
              child: const CardsBody(),
            ),
          ),
          const Expanded(
            flex: 1,
            child: CardsHorizontal(),
          ),
        ],
      ),
    );
  }
}
