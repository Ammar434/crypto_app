import 'package:crypto_app/responsive/size_config.dart';
import 'package:crypto_app/screens/authentication/login_page_handler.dart';
import 'package:crypto_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:full_screen_image_null_safe/full_screen_image_null_safe.dart';

import 'call_information.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen(
      {Key? key,
      required this.image,
      required this.text1,
      required this.text2,
      required this.text3,
      required this.text4})
      : super(key: key);
  final String image;
  final String text1;
  final String text2;
  final String text3;
  final String text4;

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.adaptive.arrow_back),
          onPressed: () {
            Navigator.pop(
              context,
              MaterialPageRoute(builder: (context) => const LoginPageHandler()),
            );
            // Navigator.pushReplacement(
            //   context,
            //   MaterialPageRoute(builder: (context) => const LoginPageHandler()),
            // );
          },
        ),
      ),
      body: SizedBox(
        width: SizeConfig.isPortrait
            ? SizeConfig.widthMultiplier * 100
            : SizeConfig.heightMultiplier * 100,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(defaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FullScreenWidget(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(defaultRadius),
                    child: Image.network(widget.image),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 5,
                ),
                Text(
                  "Détail du call :",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: SizeConfig.heightMultiplier * 3,
                  ),
                ),
                CallInformation(title: 'BUY : ', value: widget.text1),
                CallInformation(title: 'PE : ', value: widget.text2),
                CallInformation(title: 'SL : ', value: widget.text3),
                CallInformation(title: 'TP : ', value: widget.text4),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
