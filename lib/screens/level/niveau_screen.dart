import 'package:crypto_app/models/users.dart';
import 'package:crypto_app/providers/user_provider.dart';
import 'package:crypto_app/responsive/size_config.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import 'level_animation.dart';

class LevelScreen extends StatefulWidget {
  const LevelScreen({Key? key}) : super(key: key);

  @override
  State<LevelScreen> createState() => _LevelScreenState();
}

class _LevelScreenState extends State<LevelScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String whichLevel(int n) {
    if (n == 0) {
      return level0Animation;
    } else if (n == 1) {
      return level1Animation;
    } else if (n == 2) {
      return level2Animation;
    } else if (n == 3) {
      return level3Animation;
    } else if (n == 4) {
      return level4Animation;
    } else if (n == 5) {
      return level5Animation;
    } else if (n == 6) {
      return level6Animation;
    } else if (n == 7) {
      return level7Animation;
    } else if (n == 8) {
      return level8Animation;
    } else if (n == 9) {
      return level9Animation;
    }
    return "";
  }

  @override
  Widget build(BuildContext context) {
    User user = Provider.of<UserProvider>(context).getUser;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text("Niveau"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: SizeConfig.heightMultiplier * 30,
            child: LottieBuilder.network(
              "https://assets10.lottiefiles.com/packages/lf20_xktjqpi6.json",
            ),
          ),
          Text(
            "Vous etes au level",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: SizeConfig.heightMultiplier * 2.5,
              fontWeight: FontWeight.bold,
            ),
          ),
          GestureDetector(
            onTap: () {
              _controller.reverse().then((value) => _controller.forward());
            },
            child: int.parse(user.level) >= 10
                ? SizedBox(
                    height: SizeConfig.heightMultiplier * 30,
                    child: Stack(
                      children: [
                        Container(
                          child: Lottie.network(
                            level1Animation,
                            repeat: false,
                            controller: _controller,
                            onLoaded: (composition) {
                              _controller
                                ..duration = composition.duration
                                ..forward();
                            },
                          ),
                        ),
                        Positioned(
                          top: 0,
                          bottom: 0,
                          right: SizeConfig.widthMultiplier * 4,
                          child: Lottie.network(
                            level0Animation,
                            repeat: false,
                            controller: _controller,
                            onLoaded: (composition) {
                              _controller
                                ..duration = composition.duration
                                ..forward();
                            },
                          ),
                        ),
                      ],
                    ),
                  )
                : Lottie.network(
                    whichLevel(int.parse(user.level)),
                    repeat: false,
                    controller: _controller,
                    onLoaded: (composition) {
                      // Configure the AnimationController with the duration of the
                      // Lottie file and start the animation.
                      _controller
                        ..duration = composition.duration
                        ..forward();
                    },
                  ),
          )
        ],
      ),
    );
  }
}
