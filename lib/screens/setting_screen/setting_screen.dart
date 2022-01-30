import 'package:crypto_app/responsive/size_config.dart';
import 'package:crypto_app/ressources/auth_method.dart';
import 'package:crypto_app/screens/introduction/home_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'settings_group.dart';
import 'settings_tile.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Parametres"),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SettingsGroup(
              textSettingGroup: "General",
              widgetList: [
                SettingsTile(
                  icon: Icons.person,
                  iconBackgroundColor: Colors.green,
                  text1: "Account Settings",
                  text2: "Modifier vos informations",
                  isArrow: true,
                  press: () {},
                ),
                SettingsTile(
                  icon: Icons.notifications,
                  iconBackgroundColor: Colors.orange,
                  text1: "Notifications",
                  text2: "Newsletter, App Updates",
                  isArrow: true,
                  press: () {},
                ),
                SettingsTile(
                  icon: Icons.logout,
                  iconBackgroundColor: Colors.teal,
                  text1: "Logout",
                  text2: "",
                  isArrow: false,
                  press: () {
                    AuthMethods().signOut();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeView(),
                      ),
                    );
                  },
                ),
                SettingsTile(
                  icon: Icons.delete,
                  iconBackgroundColor: Colors.red,
                  text1: "Delete Account",
                  text2: "",
                  isArrow: false,
                  press: () {},
                ),
              ],
            ),
            SettingsGroup(
              textSettingGroup: 'Feedback',
              widgetList: [
                SettingsTile(
                  icon: Icons.bug_report,
                  iconBackgroundColor: Colors.purple,
                  text1: "Report a bug",
                  text2: "",
                  isArrow: false,
                  press: () {},
                ),
                SettingsTile(
                  icon: Icons.thumb_up,
                  iconBackgroundColor: Colors.pink,
                  text1: "Sent a feedback",
                  text2: "",
                  isArrow: false,
                  press: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
