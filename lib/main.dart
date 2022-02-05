import 'package:crypto_app/providers/user_provider.dart';
import 'package:crypto_app/responsive/size_config.dart';
import 'package:crypto_app/screens/authentication/login_page_handler.dart';
import 'package:crypto_app/screens/introduction/home_model.dart';
import 'package:crypto_app/services/local_notification.dart';
import 'package:crypto_app/utils/colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("Handling a background message: ${message.messageId}");
}

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
    LocalNotificationService.initialize();
    await Firebase.initializeApp();
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
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
                home: const LoginPageHandler(),
              );
            },
          );
        },
      ),
    );
  }
}
