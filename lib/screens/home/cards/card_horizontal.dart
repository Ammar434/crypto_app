import 'package:crypto_app/utils/colors.dart';
import 'package:crypto_app/utils/constants.dart';
import 'package:flutter/material.dart';

class CardsHorizontal extends StatefulWidget {
  const CardsHorizontal({Key? key}) : super(key: key);

  @override
  State<CardsHorizontal> createState() => _CardsHorizontalState();
}

class _CardsHorizontalState extends State<CardsHorizontal>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    CurvedAnimation curvedAnimation =
        CurvedAnimation(parent: _controller, curve: Curves.easeInExpo);
    _animation = Tween<double>(begin: 0, end: 17000).animate(curvedAnimation);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, snapshot) {
        return Column(
          children: [
            Padding(
              padding: EdgeInsets.all(defaultPadding),
              child: const Text(
                "Benefices",
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                //Ramene sur le site web pour preuve
              },
              child: Container(
                height: 120,
                margin: EdgeInsets.symmetric(horizontal: defaultPadding * 5),
                decoration: BoxDecoration(
                  color: const Color(0xFF272c30),
                  borderRadius: BorderRadius.circular(defaultRadius),
                  border: Border.all(color: accentColor, width: 5),
                ),
                child: Center(
                  child: Text(
                    _animation.value.toStringAsFixed(0) + " €",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
