import 'package:crypto_app/responsive/size_config.dart';
import 'package:crypto_app/screens/home/home.dart';
import 'package:crypto_app/screens/introduction/home_model.dart';
import 'package:crypto_app/screens/introduction/home_view.dart';
import 'package:crypto_app/utils/colors.dart';
import 'package:crypto_app/utils/constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put<MyDrawerController>(MyDrawerController());
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
      child: LayoutBuilder(builder: (context, constraints) {
        return OrientationBuilder(builder: (context, orientation) {
          SizeConfig().init(constraints, orientation);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Crypto App',
            theme: ThemeData.dark().copyWith(
              backgroundColor: mobileBackgroundColor,
              scaffoldBackgroundColor: mobileBackgroundColor,
              textTheme: const TextTheme(
                headline2: TextStyle(fontSize: 16.0, color: Colors.black),
              ),
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
            home: const HomeView(),
          );
        });
      }),
    );
  }
}
