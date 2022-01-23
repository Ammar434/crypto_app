import 'package:crypto_app/utils/globals.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home_model.dart';

class AnimatedCircle extends AnimatedWidget {
  final Tween<double> tween;
  final Tween<double> horizontalTween;
  final Animation<double> animation;
  final Animation<double> horizontalAnimation;
  final double flip;
  final Color color;

  const AnimatedCircle({
    Key? key,
    required this.animation,
    required this.horizontalTween,
    required this.horizontalAnimation,
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
                ? horizontalTween.evaluate(horizontalAnimation)
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
  late AnimationController garbageAnimationController;
  late Animation<double> garbageAnimation;
  late Animation<double> startAnimation;
  late Animation<double> endAnimation;
  late Animation<double> horizontalAnimation;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
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
    garbageAnimationController = AnimationController(
      duration: const Duration(milliseconds: 0),
      vsync: this,
    );
    garbageAnimation = CurvedAnimation(
      parent: garbageAnimationController,
      curve: const Interval(
        0,
        0,
        curve: Curves.easeInQuad,
      ),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<HomeModel>(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor:
          model.isHalfWay ? model.foreGroundColor : model.backGroundColor,
      body: Stack(
        children: [
          Container(
            color:
                model.isHalfWay ? model.foreGroundColor : model.backGroundColor,
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
                if (animationController.status != AnimationStatus.forward) {
                  model.isToggled = !model.isToggled;
                  model.index++;
                  if (model.index > 3) {
                    model.index = 0;
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
                    horizontalTween: Tween<double>(begin: 0, end: 0),
                    horizontalAnimation: garbageAnimation,
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
            child: PageView.builder(
              controller: pageController,
              itemCount: 4,
              itemBuilder: (context, index) {
                return Center(
                  child: Text(
                    'Page ${index + 1}',
                    style: TextStyle(
                      color: index % 2 == 0 ? Global.mediumBlue : Global.white,
                      fontSize: 30.0,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}