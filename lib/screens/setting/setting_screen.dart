import 'package:crypto_app/responsive/size_config.dart';
import 'package:crypto_app/ressources/auth_method.dart';
import 'package:crypto_app/screens/authentication/auth_screen.dart';
import 'package:crypto_app/screens/setting/change_address_screen.dart';
import 'package:crypto_app/screens/setting/change_password_screen.dart';
import 'package:crypto_app/screens/setting/change_phone_number_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
          children: [
            SizedBox(
              height: SizeConfig.heightMultiplier * 5,
            ),
            SettingsGroup(
              textSettingGroup: "General",
              widgetList: [
                SettingsTile(
                  icon: FontAwesomeIcons.key,
                  iconBackgroundColor: Colors.blueAccent,
                  text1: "Modifier votre mot de passe",
                  isArrow: true,
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ChangePasswordScreen(),
                      ),
                    );
                  },
                ),
                SettingsTile(
                  icon: FontAwesomeIcons.map,
                  iconBackgroundColor: Colors.red,
                  text1: "Modifier votre adresse",
                  isArrow: true,
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ChangeAddressScreen(),
                      ),
                    );
                  },
                ),
                SettingsTile(
                  icon: FontAwesomeIcons.mobile,
                  iconBackgroundColor: Colors.green,
                  text1: "Modifier votre numero",
                  isArrow: true,
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ChangePhoneNumberScreen(),
                      ),
                    );
                  },
                ),
                SettingsTile(
                  icon: Icons.logout,
                  iconBackgroundColor: Colors.teal,
                  text1: "Logout",
                  isArrow: false,
                  press: () {
                    AuthMethods().signOut();
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AuthScreen()),
                      (Route<dynamic> route) => false,
                    );
                  },
                ),
                SettingsTile(
                    icon: Icons.delete,
                    iconBackgroundColor: Colors.red,
                    text1: "Delete Account",
                    isArrow: false,
                    press: () {
                      // set up the buttons
                      Widget cancelButton = TextButton(
                        child: const Text("Non"),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      );
                      Widget continueButton = TextButton(
                        child: const Text("Continue"),
                        onPressed: () {
                          AuthMethods().deleteUser();
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AuthScreen()),
                            (Route<dynamic> route) => false,
                          );
                        },
                      );
                      // set up the AlertDialog
                      AlertDialog alert = AlertDialog(
                        title: const Text("Attention!"),
                        content: const Text(
                            "Poursuivre la suppression de votre compte?"),
                        actions: [
                          cancelButton,
                          continueButton,
                        ],
                      );
                      // show the dialog
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return alert;
                        },
                      );
                    }),
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
