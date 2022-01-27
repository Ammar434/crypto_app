import 'package:crypto_app/screens/informations/information_screen.dart';
import 'package:flutter/material.dart';
import 'package:crypto_app/responsive/size_config.dart';
import 'package:crypto_app/ressources/auth_method.dart';
import 'package:crypto_app/screens/academy/academy_home.dart';
import 'package:crypto_app/utils/colors.dart';
import 'package:crypto_app/widget/drawer_item.dart';
import 'package:crypto_app/widget/rounded_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'home.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: primaryColor,
        padding: const EdgeInsets.symmetric(vertical: 100),
        child: ListView(
          children: [
            DrawerItem(
              text: "Academy",
              iconData: FontAwesomeIcons.video,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AcademyHome(),
                  ),
                );
              },
            ),
            DrawerItem(
              text: "Mes informations",
              iconData: FontAwesomeIcons.home,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const InformationScreen(),
                  ),
                );
              },
            ),
            DrawerItem(
                text: "Mes factures",
                iconData: FontAwesomeIcons.moneyBill,
                press: () {}),
            DrawerItem(
                text: "Mes documents",
                iconData: FontAwesomeIcons.idCardAlt,
                press: () {}),
            DrawerItem(
                text: "Mes retraits",
                iconData: FontAwesomeIcons.coins,
                press: () {}),
            DrawerItem(
                text: "Mon évolution",
                iconData: FontAwesomeIcons.chartLine,
                press: () {}),
            DrawerItem(
              text: "Parametres",
              iconData: FontAwesomeIcons.cog,
              press: () {},
            ),
            DrawerItem(
              text: "Se déconnecter",
              iconData: FontAwesomeIcons.signOutAlt,
              color: Colors.red,
              press: () {
                AuthMethods().signOut();
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: SizeConfig.widthMultiplier * 3,
                right: SizeConfig.widthMultiplier * 53,
              ),
              child: RoundedButton(
                onTap: () {},
                text: "Nous conctater",
              ),
            )
          ],
        ),
      ),
    );
  }
}
