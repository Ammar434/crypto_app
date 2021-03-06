import 'package:chewie/chewie.dart';
import 'package:crypto_app/responsive/size_config.dart';
import 'package:crypto_app/screens/authentication/auth_screen.dart';
import 'package:crypto_app/screens/introduction/home_card.dart';
import 'package:crypto_app/utils/colors.dart';
import 'package:crypto_app/utils/globals.dart';
import 'package:crypto_app/utils/introduction_card.dart';
import 'package:crypto_app/utils/url.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

import 'home_model.dart';

class AnimatedCircle extends AnimatedWidget {
  final Tween<double> tween;
  final Tween<double>? horizontalTween;
  final Animation<double> animation;
  final Animation<double>? horizontalAnimation;
  final double flip;
  final Color color;

  const AnimatedCircle({
    Key? key,
    required this.animation,
    this.horizontalTween,
    this.horizontalAnimation,
    required this.color,
    required this.flip,
    required this.tween,
  })  : assert(flip == 1 || flip == -1),
        super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<HomeModel>(context);
    return Transform(
      alignment: FractionalOffset.centerLeft,
      transform: Matrix4.identity()
        ..scale(
          tween.evaluate(animation) * flip,
          tween.evaluate(animation),
        ),
      child: Transform(
        transform: Matrix4.identity()
          ..translate(
            horizontalTween != null
                ? horizontalTween?.evaluate(horizontalAnimation!)
                : 0.0,
          ),
        child: Container(
          width: Global.radius,
          height: Global.radius,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(
              Global.radius / 2.0 -
                  tween.evaluate(animation) / (Global.radius / 2.0),
            ),
          ),
          child: Icon(
            flip == 1 ? Icons.keyboard_arrow_right : Icons.keyboard_arrow_left,
            color: model.index % 2 == 0 ? Global.white : Global.mediumBlue,
          ),
        ),
      ),
    );
  }
}

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  late AnimationController animationController;

  late Animation<double> startAnimation;
  late Animation<double> endAnimation;
  late Animation<double> horizontalAnimation;
  late PageController pageController;
  late VideoPlayerController videoPlayerController;
  bool _isLoading = false;
  ChewieController? chewieController;

  @override
  void initState() {
    super.initState();
    setState(() {
      _isLoading = true;
    });
    initVideo();
    pageController = PageController();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 750),
    );
    startAnimation = CurvedAnimation(
      parent: animationController,
      curve: const Interval(
        0.0,
        0.5,
        curve: Curves.easeInExpo,
      ),
    );
    endAnimation = CurvedAnimation(
      parent: animationController,
      curve: const Interval(
        0.500,
        1.000,
        curve: Curves.easeOutExpo,
      ),
    );
    horizontalAnimation = CurvedAnimation(
      parent: animationController,
      curve: const Interval(
        0.750,
        1.000,
        curve: Curves.easeInQuad,
      ),
    );
    animationController
      ..addStatusListener((status) {
        final model = Provider.of<HomeModel>(context, listen: false);
        if (status == AnimationStatus.completed) {
          model.swapColors();
          animationController.reset();
        }
      })
      ..addListener(
        () {
          final model = Provider.of<HomeModel>(context, listen: false);
          if (animationController.value > 0.5) {
            model.isHalfWay = true;
          } else {
            model.isHalfWay = false;
          }
        },
      );
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    videoPlayerController.dispose();
    chewieController?.pause();
    chewieController?.dispose();
    super.dispose();
  }

  void initVideo() async {
    videoPlayerController =
        VideoPlayerController.network(lifestyleAcademyPresentationVideo);
    await videoPlayerController.initialize();
    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      autoPlay: false,
      showControls: false,
    );

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<HomeModel>(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor:
          model.isHalfWay ? model.foreGroundColor : model.backGroundColor,
      body: _isLoading
          ? const CircularProgressIndicator()
          : Stack(
              children: [
                Container(
                  color: model.isHalfWay
                      ? model.foreGroundColor
                      : model.backGroundColor,
                  width: screenWidth / 2.0 - Global.radius / 2.0,
                  height: double.infinity,
                ),
                Transform(
                  transform: Matrix4.identity()
                    ..translate(
                      screenWidth / 2 - Global.radius / 2.0,
                      screenHeight - Global.radius - Global.bottomPadding,
                    ),
                  child: GestureDetector(
                    onTap: () {
                      if (animationController.status !=
                          AnimationStatus.forward) {
                        model.isToggled = !model.isToggled;
                        model.index++;
                        if (model.index == 1) {
                          chewieController?.videoPlayerController.play();
                        }
                        if (model.index >= introductionCardList.length) {
                          chewieController?.videoPlayerController.pause();
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AuthScreen(),
                            ),
                          );
                        }
                        pageController.animateToPage(model.index,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOutQuad);
                        animationController.forward();
                      }
                    },
                    child: Stack(
                      children: <Widget>[
                        AnimatedCircle(
                          animation: startAnimation,
                          color: model.foreGroundColor,
                          flip: 1.0,
                          tween: Tween<double>(begin: 1.0, end: Global.radius),
                        ),
                        AnimatedCircle(
                          animation: endAnimation,
                          color: model.backGroundColor,
                          flip: -1.0,
                          horizontalTween:
                              Tween<double>(begin: 0, end: -Global.radius),
                          horizontalAnimation: horizontalAnimation,
                          tween: Tween<double>(begin: Global.radius, end: 1.0),
                        ),
                      ],
                    ),
                  ),
                ),
                IgnorePointer(
                  ignoring: true,
                  child: PageView(
                    controller: pageController,
                    children: [
                      const HomeCard(index: 0, color: textColor),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.only(
                            bottom: SizeConfig.heightMultiplier * 15),
                        child: !videoPlayerController.value.isInitialized
                            ? const CircularProgressIndicator()
                            : Chewie(
                                controller: chewieController!,
                              ),
                      )
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
