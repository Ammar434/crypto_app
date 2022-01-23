import 'package:crypto_app/responsive/mobile_screen_layout.dart';
import 'package:crypto_app/responsive/responsive_layout.dart';
import 'package:crypto_app/responsive/web_screen_layout.dart';
import 'package:crypto_app/screens/authentication/auth_screen.dart';
import 'package:crypto_app/screens/introduction/home_model.dart';
import 'package:crypto_app/utils/colors.dart';
import 'package:crypto_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomeModel(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Crypto App',
        theme: ThemeData.dark().copyWith(
          backgroundColor: mobileBackgroundColor,
          inputDecorationTheme: InputDecorationTheme(
            filled: true,
            fillColor: Colors.white38,
            border: InputBorder.none,
            hintStyle: const TextStyle(color: Colors.white),
            contentPadding: EdgeInsets.symmetric(
              vertical: defaultPadding * 1.2,
              horizontal: defaultPadding,
            ),
          ),
        ),
        home: const AuthScreen(),
      ),
    );
  }
}
