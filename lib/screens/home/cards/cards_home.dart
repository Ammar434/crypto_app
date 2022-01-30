import 'package:crypto_app/utils/colors.dart';
import 'package:crypto_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import 'card_horizontal.dart';
import 'cards_body.dart';

class CardsHome extends StatelessWidget {
  const CardsHome({Key? key}) : super(key: key);

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
        ),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          color: textColor,
          onPressed: () {
            ZoomDrawer.of(context)?.toggle.call();
          },
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
