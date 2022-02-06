import 'package:crypto_app/screens/home/home.dart';
import 'package:crypto_app/screens/notifications/notification_screen.dart';
import 'package:crypto_app/services/local_notification.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class MobileScreenLayout extends StatefulWidget {
  const MobileScreenLayout({Key? key}) : super(key: key);

  @override
  State<MobileScreenLayout> createState() => _MobileScreenLayoutState();
}

class _MobileScreenLayoutState extends State<MobileScreenLayout> {
  void manageMessage(RemoteMessage? message) {
    if (message != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => NotificationScreen(
            image: message.data["image"],
            text1: message.data["buy"],
            text2: message.data["pe"],
            text3: message.data["sl"],
            text4: message.data["tp"],
          ),
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();

    //Background
    FirebaseMessaging.instance.getInitialMessage().then(
      (message) {
        manageMessage(message);
      },
    );
    //Foreground
    FirebaseMessaging.onMessage.listen(
      (message) {
        // manageMessage(message);
        LocalNotificationService.display(message);
      },
    );
    //Only work when app in background and open
    FirebaseMessaging.onMessageOpenedApp.listen(
      (message) {
        manageMessage(message);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const HomeScreen();
  }
}
