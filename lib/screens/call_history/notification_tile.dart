import 'package:crypto_app/responsive/size_config.dart';
import 'package:crypto_app/screens/notifications/notification_screen.dart';
import 'package:crypto_app/utils/colors.dart';
import 'package:crypto_app/utils/constants.dart';
import 'package:flutter/material.dart';

class NotificationTile extends StatelessWidget {
  const NotificationTile({
    Key? key,
    required this.image,
    required this.buy,
    required this.sl,
    required this.tp,
    required this.pe,
  }) : super(key: key);

  final String image;
  final String buy;
  final String sl;
  final String tp;
  final String pe;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NotificationScreen(
              image: image,
              text1: buy,
              text2: pe,
              text3: sl,
              text4: tp,
            ),
          ),
        );
      },
      child: Container(
        width: SizeConfig.widthMultiplier * 100,
        height: SizeConfig.heightMultiplier * 15,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(defaultRadius),
          border: Border.all(
            color: accentColor,
            width: SizeConfig.widthMultiplier / 2,
          ),
        ),
        margin: EdgeInsets.symmetric(
          vertical: SizeConfig.heightMultiplier,
          horizontal: SizeConfig.widthMultiplier * 5,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              buy,
              style: TextStyle(
                fontSize: SizeConfig.heightMultiplier * 2.2,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              pe,
              style: TextStyle(
                fontSize: SizeConfig.heightMultiplier * 2,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              sl,
              style: TextStyle(
                fontSize: SizeConfig.heightMultiplier * 2,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              tp,
              style: TextStyle(
                fontSize: SizeConfig.heightMultiplier * 2,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
