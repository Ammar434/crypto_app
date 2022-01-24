import 'package:crypto_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem({
    Key? key,
    required this.text,
    required this.iconData,
    required this.press,
  }) : super(key: key);
  final String text;
  final IconData iconData;
  final GestureTapCallback press;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: size.height / 80, horizontal: size.height / 45),
      child: GestureDetector(
        onTap: press,
        child: Row(
          children: [
            FaIcon(
              iconData,
              color: primaryColor,
              size: size.height / 30,
            ),
            SizedBox(
              width: size.width / 50,
            ),
            Text(
              text,
              style: TextStyle(
                  fontSize: size.height / 40,
                  color: primaryColor,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
