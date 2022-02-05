import 'package:crypto_app/models/users.dart';
import 'package:crypto_app/providers/user_provider.dart';
import 'package:crypto_app/responsive/size_config.dart';
import 'package:crypto_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InformationScreen extends StatelessWidget {
  const InformationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User user = Provider.of<UserProvider>(context).getUser;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text("Informations"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.widthMultiplier * 10,
          vertical: SizeConfig.heightMultiplier * 5,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            InformationTileWidget(
              title: 'Adresse e-mail',
              text: user.email,
            ),
            InformationTileWidget(
              title: "Jour restant à l'Academy",
              text: user.dayLeft >= 0
                  ? user.dayLeft.toString()
                  : "Aucun abonnement",
            ),
            InformationTileWidget(
              title: "Adresse",
              text: user.address,
            ),
            InformationTileWidget(
              title: "Numero",
              text: user.phoneNumber,
            ),
            InformationTileWidget(
              title: "A rejoins le ",
              text: user.dateJoined,
            ),
          ],
        ),
      ),
    );
    /*Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(user.email),
          Text(user.phoneNumber),
          Text(user.address),
          Text(user.mt4Address),
          Text(user.mt5Address),
          Text(user.level)
        ],
      ),
    );*/
  }
}

class InformationTileWidget extends StatelessWidget {
  const InformationTileWidget({
    Key? key,
    required this.title,
    required this.text,
  }) : super(key: key);

  final String title;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(SizeConfig.widthMultiplier * 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: SizeConfig.heightMultiplier * 2.2,
              fontWeight: FontWeight.w500,
              color: accentColor,
            ),
          ),
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.white70,
                  width: 2,
                ),
              ),
            ),
            child: Text(
              text,
              style: TextStyle(
                fontSize: SizeConfig.heightMultiplier * 2.2,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
