import 'dart:math';

import 'package:crypto_app/screens/authentication/sign_up_form.dart';
import 'package:crypto_app/screens/home/home.dart';
import 'package:crypto_app/utils/colors.dart';
import 'package:crypto_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'login_form.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen>
    with SingleTickerProviderStateMixin {
  bool _isShowSignUp = false;
  late AnimationController _animationController;
  late Animation<double> _animationTextRotate;
  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: defaultDuration);
    _animationTextRotate =
        Tween<double>(begin: 0, end: 90).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void updateView() {
    setState(() {
      _isShowSignUp = !_isShowSignUp;
    });
    _isShowSignUp
        ? _animationController.forward()
        : _animationController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    return Scaffold(
      body: AnimatedBuilder(
        animation: _animationController,
        builder: (context, _) {
          return Stack(
            children: [
              AnimatedPositioned(
                duration: defaultDuration,
                width: _size.width * 0.88,
                height: _size.height,
                left: _isShowSignUp ? -_size.width * 0.76 : 0,
                child: Container(
                  color: mobileBackgroundColor,
                  child: const LoginForm(),
                ),
              ),
              Positioned(
                height: _size.height,
                width: _size.width * 0.88,
                left: _isShowSignUp ? _size.width * 0.12 : _size.width * 0.88,
                child: Container(
                  color: accentColor,
                  child: const SignUpForm(),
                ),
              ),
              AnimatedPositioned(
                duration: defaultDuration,
                top: _size.height * 0.1,
                left: 0,
                right: _isShowSignUp ? -_size.width * 0.06 : _size.width * 0.06,
                child: CircleAvatar(
                  backgroundColor:
                      _isShowSignUp ? accentColor : mobileBackgroundColor,
                  radius: 25,
                  child: AnimatedSwitcher(
                    duration: defaultDuration,
                    child: _isShowSignUp
                        ? SvgPicture.asset(
                            "assets/images/authentication/login-svgrepo-com.svg",
                            color: mobileBackgroundColor,
                          )
                        : SvgPicture.asset(
                            "assets/images/authentication/register-svgrepo-com.svg",
                            color: accentColor,
                          ),
                  ),
                ),
              ),
              AnimatedPositioned(
                left: _isShowSignUp ? 0 : _size.width * 0.44 - 80,
                bottom:
                    _isShowSignUp ? _size.height / 2 - 80 : _size.height * 0.3,
                duration: defaultDuration,
                child: AnimatedDefaultTextStyle(
                  duration: defaultDuration,
                  style: TextStyle(
                    fontSize: _isShowSignUp ? 20 : 32,
                    fontWeight: FontWeight.bold,
                    color: _isShowSignUp ? Colors.white : Colors.white70,
                  ),
                  child: Transform.rotate(
                    angle: -_animationTextRotate.value * pi / 180,
                    alignment: Alignment.topLeft,
                    child: InkWell(
                      onTap: () {
                        if (_isShowSignUp) {
                          updateView();
                        } else {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Home()));
                          //Login
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: defaultPadding * 0.75,
                        ),
                        width: 160,
                        child: Text(
                          "Log In".toUpperCase(),
                          textAlign: TextAlign.center,
                          style: const TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              AnimatedPositioned(
                right: _isShowSignUp ? _size.width * 0.44 - 80 : 0,
                bottom:
                    !_isShowSignUp ? _size.height / 2 - 80 : _size.height * 0.3,
                duration: defaultDuration,
                child: AnimatedDefaultTextStyle(
                  duration: defaultDuration,
                  style: TextStyle(
                    fontSize: !_isShowSignUp ? 20 : 32,
                    fontWeight: FontWeight.bold,
                    color: _isShowSignUp ? Colors.white : Colors.white70,
                  ),
                  child: Transform.rotate(
                    angle: (90 - _animationTextRotate.value) * pi / 180,
                    alignment: Alignment.topRight,
                    child: InkWell(
                      onTap: () {
                        if (_isShowSignUp) {
                          //Register
                        } else {
                          updateView();
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: defaultPadding * 0.75,
                        ),
                        width: 160,
                        child: Text(
                          "Sign UP".toUpperCase(),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
