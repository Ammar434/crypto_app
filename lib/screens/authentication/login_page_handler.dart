import 'package:crypto_app/responsive/mobile_screen_layout.dart';
import 'package:crypto_app/responsive/responsive_layout.dart';
import 'package:crypto_app/responsive/size_config.dart';
import 'package:crypto_app/responsive/web_screen_layout.dart';
import 'package:crypto_app/screens/introduction/home_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LoginPageHandler extends StatelessWidget {
  const LoginPageHandler({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          // Checking if the snapshot has any data or not
          if (snapshot.hasData) {
            // if snapshot has data which means user is logged in then we check the width of screen and accordingly display the screen layout
            return const ResponsiveLayout(
              mobileScreenLayout: MobileScreenLayout(),
              webScreenLayout: WebScreenLayout(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('${snapshot.error}'),
            );
          }
        }

        // means connection to future hasnt been made yet
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SizedBox(
            height: SizeConfig.heightMultiplier * 40,
            width: SizeConfig.heightMultiplier * 40,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        return const HomeView();
      },
    );
  }
}
