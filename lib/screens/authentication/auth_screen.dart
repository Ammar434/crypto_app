import 'dart:math';

import 'package:crypto_app/responsive/mobile_screen_layout.dart';
import 'package:crypto_app/responsive/responsive_layout.dart';
import 'package:crypto_app/responsive/size_config.dart';
import 'package:crypto_app/responsive/web_screen_layout.dart';
import 'package:crypto_app/ressources/auth_method.dart';
import 'package:crypto_app/screens/authentication/sign_up_form.dart';
import 'package:crypto_app/utils/colors.dart';
import 'package:crypto_app/utils/constants.dart';
import 'package:crypto_app/utils/utils.dart';
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
  bool _isLoading = false;

  late AnimationController _animationController;
  late Animation<double> _animationTextRotate;
  late TextEditingController _emailController;
  late TextEditingController _pwdController;
  late TextEditingController _pwdConfirmController;
  late TextEditingController _adressController;
  late TextEditingController _numeroController;

  late TextEditingController _emailControllerLogIn;

  late TextEditingController _pwdControllerLogIn;
  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: defaultDuration);
    _animationTextRotate =
        Tween<double>(begin: 0, end: 90).animate(_animationController);
    _emailController = TextEditingController();
    _pwdController = TextEditingController();
    _pwdConfirmController = TextEditingController();
    _adressController = TextEditingController();
    _numeroController = TextEditingController();
    _emailControllerLogIn = TextEditingController();
    _pwdControllerLogIn = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();

    _animationController.dispose();
    _emailController.dispose();
    _pwdController.dispose();
    _pwdConfirmController.dispose();
    _adressController.dispose();
    _numeroController.dispose();
    _emailControllerLogIn.dispose();
    _pwdControllerLogIn.dispose();
  }

  void updateView() {
    setState(() {
      _isShowSignUp = !_isShowSignUp;
    });
    _isShowSignUp
        ? _animationController.forward()
        : _animationController.reverse();
  }

  void signUpUser() async {
    setState(
      () {
        _isLoading = true;
      },
    );
    String res = await AuthMethods().signUpUser(
      email: _emailController.text,
      password: _pwdController.text,
      address: _adressController.text,
      phoneNumber: _numeroController.text,
      passwordConfirm: _pwdConfirmController.text,
    );
    setState(
      () {
        _isLoading = false;
      },
    );
    if (res != "success") {
      showSnackBar(context, res);
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const ResponsiveLayout(
            mobileScreenLayout: MobileScreenLayout(),
            webScreenLayout: WebScreenLayout(),
          ),
        ),
      );
    }
  }

  void loginUser() async {
    String res = await AuthMethods().loginUser(
      email: _emailControllerLogIn.text,
      password: _pwdControllerLogIn.text,
    );
    if (res == "success") {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const ResponsiveLayout(
            mobileScreenLayout: MobileScreenLayout(),
            webScreenLayout: WebScreenLayout(),
          ),
        ),
      );
    } else {
      showSnackBar(context, res);
    }
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: accentColor,
      resizeToAvoidBottomInset: false,
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
                  color: backgroundColor,
                  child: LoginForm(
                    pwdController: _pwdControllerLogIn,
                    emailController: _emailControllerLogIn,
                  ),
                ),
              ),
              Positioned(
                height: MediaQuery.of(context).viewInsets.bottom != 0
                    ? _size.height / 1.3
                    : _size.height,
                width: _size.width * 0.88,
                left: _isShowSignUp ? _size.width * 0.12 : _size.width * 0.88,
                child: Container(
                  color: accentColor,
                  child: SignUpForm(
                    adressController: _adressController,
                    emailController: _emailController,
                    pwdController: _pwdController,
                    pwdConfirmController: _pwdConfirmController,
                    numeroController: _numeroController,
                  ),
                ),
              ),
              AnimatedPositioned(
                duration: defaultDuration,
                top: _size.height * 0.1,
                left: 0,
                right: _isShowSignUp ? -_size.width * 0.06 : _size.width * 0.06,
                child: CircleAvatar(
                  backgroundColor:
                      _isShowSignUp ? accentColor : backgroundColor,
                  radius: 25,
                  child: AnimatedSwitcher(
                    duration: defaultDuration,
                    child: _isShowSignUp
                        ? SvgPicture.asset(
                            "assets/images/authentication/login-svgrepo-com.svg",
                            color: textColor,
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
                          loginUser();
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: defaultPadding * 0.75,
                        ),
                        width: SizeConfig.widthMultiplier * 40,
                        child: Text(
                          "Log In".toUpperCase(),
                          textAlign: TextAlign.center,
                          style: _isShowSignUp
                              ? const TextStyle(color: Colors.white54)
                              : Theme.of(context).textTheme.headline1,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              AnimatedPositioned(
                right: _isShowSignUp ? _size.width * 0.44 - 80 : 0,
                bottom:
                    !_isShowSignUp ? _size.height / 2 - 80 : _size.height * 0.1,
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
                          signUpUser();
                        } else {
                          updateView();
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: defaultPadding * 0.75,
                        ),
                        width: SizeConfig.widthMultiplier * 40,
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
