import 'package:crypto_app/responsive/size_config.dart';
import 'package:crypto_app/screens/academy/academy_home.dart';
import 'package:crypto_app/screens/documents/document_screen.dart';
import 'package:crypto_app/screens/evolution/evolution_screen.dart';
import 'package:crypto_app/screens/facture/facture_screen.dart';
import 'package:crypto_app/screens/informations/information_screen.dart';
import 'package:crypto_app/screens/setting_screen/setting_screen.dart';
import 'package:crypto_app/utils/colors.dart';
import 'package:crypto_app/utils/constants.dart';
import 'package:crypto_app/widget/drawer_item.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: primaryColor,
          height: SizeConfig.heightMultiplier * 100,
          padding: const EdgeInsets.symmetric(vertical: 100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
                iconData: FontAwesomeIcons.userAlt,
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
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const FactureScreen(),
                      ),
                    );
                  }),
              DrawerItem(
                  text: "Mes documents",
                  iconData: FontAwesomeIcons.idCardAlt,
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DocumentScreen(),
                      ),
                    );
                  }),
              DrawerItem(
                  text: "Mon évolution",
                  iconData: FontAwesomeIcons.chartLine,
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const EvolutionScreen(),
                      ),
                    );
                  }),
              DrawerItem(
                text: "Parametres",
                iconData: FontAwesomeIcons.cog,
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SettingScreen(),
                    ),
                  );
                },
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: size.height / 80,
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(defaultPadding),
                      child: FaIcon(
                        FontAwesomeIcons.instagram,
                        color: Colors.red,
                        size: size.height / 25,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(defaultPadding),
                      child: FaIcon(
                        FontAwesomeIcons.telegram,
                        color: const Color(0xFF2AABEE),
                        size: size.height / 25,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(defaultPadding),
                      child: FaIcon(
                        FontAwesomeIcons.discord,
                        color: const Color(0xFF7289da),
                        size: size.height / 25,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
