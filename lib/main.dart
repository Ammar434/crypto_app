import 'package:crypto_app/providers/user_provider.dart';
import 'package:crypto_app/responsive/mobile_screen_layout.dart';
import 'package:crypto_app/responsive/responsive_layout.dart';
import 'package:crypto_app/responsive/size_config.dart';
import 'package:crypto_app/responsive/web_screen_layout.dart';
import 'package:crypto_app/screens/introduction/home_model.dart';
import 'package:crypto_app/screens/introduction/home_view.dart';
import 'package:crypto_app/utils/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyBJT5lwY0AmhyLqiRcyJt9N8XzvOfZ7LOM",
        authDomain: "lifestyleacademy-dc33d.firebaseapp.com",
        projectId: "lifestyleacademy-dc33d",
        storageBucket: "lifestyleacademy-dc33d.appspot.com",
        messagingSenderId: "839477594977",
        appId: "1:839477594977:web:3786fe1aea6db1e88b5320",
        measurementId: "G-EV6428ZC7Y",
      ),
    );
  } else {
    await Firebase.initializeApp();
  }

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
        ),
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
        ),
      ],
      child: LayoutBuilder(
        builder: (context, constraints) {
          return OrientationBuilder(
            builder: (context, orientation) {
              SizeConfig().init(constraints, orientation);
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Lifestyle Academy',
                theme: ThemeData.dark().copyWith(
                  backgroundColor: backgroundColor,
                  scaffoldBackgroundColor: backgroundColor,
                  textTheme: TextTheme(
                    headline1: TextStyle(
                      fontSize: SizeConfig.heightMultiplier * 4,
                      color: textColor,
                      fontWeight: FontWeight.w800,
                    ),
                    headline2: TextStyle(
                      fontSize: SizeConfig.heightMultiplier * 2,
                      color: textColor,
                    ),
                  ),
                ),
                home: StreamBuilder(
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

                    return HomeView();
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
