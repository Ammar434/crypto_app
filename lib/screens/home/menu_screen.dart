import 'package:crypto_app/models/users.dart';
import 'package:crypto_app/providers/user_provider.dart';
import 'package:crypto_app/responsive/size_config.dart';
import 'package:crypto_app/screens/academy/academy_home.dart';
import 'package:crypto_app/screens/call_history/call_history_screen.dart';
import 'package:crypto_app/screens/evolution/evolution_screen.dart';
import 'package:crypto_app/screens/informations/information_screen.dart';
import 'package:crypto_app/screens/level/niveau_screen.dart';
import 'package:crypto_app/screens/setting/setting_screen.dart';
import 'package:crypto_app/screens/special_user/special_user.dart';
import 'package:crypto_app/utils/colors.dart';
import 'package:crypto_app/widget/drawer_item.dart';
import 'package:crypto_app/widget/social_row.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User user = Provider.of<UserProvider>(context).getUser;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: primaryColor,
          height: SizeConfig.heightMultiplier * 100,
          padding: EdgeInsets.symmetric(
            vertical: SizeConfig.heightMultiplier * 10,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (user.specialUser == true)
                DrawerItem(
                  text: "VIP",
                  iconData: FontAwesomeIcons.solidStar,
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SpecialUser(),
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
                text: "Nos calls",
                iconData: FontAwesomeIcons.bitcoin,
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CallHistoryScreen(),
                    ),
                  );
                },
              ),
              DrawerItem(
                text: "Mon evolution",
                iconData: FontAwesomeIcons.solidChartBar,
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const EvolutionScreen(),
                    ),
                  );
                },
              ),
              DrawerItem(
                text: "Mon niveau",
                iconData: FontAwesomeIcons.superpowers,
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LevelScreen(),
                    ),
                  );
                },
              ),
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
              const SocialRow(),
            ],
          ),
        ),
      ),
    );
  }
}
