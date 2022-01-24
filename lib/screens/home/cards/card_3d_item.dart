import 'dart:math';
import 'dart:ui';

import 'package:crypto_app/utils/cards.dart';
import 'package:flutter/material.dart';

import 'card_3d_widget.dart';

class Card3dItem extends AnimatedWidget {
  final Card3d card;
  final double percent;
  final double height;
  final int depth;
  final ValueChanged<Card3d> onCardSelected;
  final int verticalFactor;
  final Animation<double> animation;
  const Card3dItem({
    Key? key,
    required this.card,
    required this.percent,
    required this.height,
    required this.depth,
    required this.onCardSelected,
    this.verticalFactor = 0,
    required this.animation,
  }) : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    const double depthFactor = 10;
    final double bottomMargin = height / 100;
    return Positioned(
      left: 0,
      right: 0,
      top: height - depth * height / 1.7 * percent - bottomMargin,
      child: Opacity(
        opacity: verticalFactor == 0 ? 1 : 1 - animation.value,
        child: Hero(
          tag: card.title,
          flightShuttleBuilder: (context, animation, flighDirection,
              fromHeroContext, toHeroContext) {
            Widget _current;

            if (flighDirection == HeroFlightDirection.push) {
              _current = toHeroContext.widget;
            } else {
              _current = fromHeroContext.widget;
            }
            return AnimatedBuilder(
              animation: animation,
              builder: (context, _) {
                final newValue = lerpDouble(0.0, 2 * pi, animation.value);

                return Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..rotateX(newValue!),
                  child: _current,
                );
              },
            );
          },
          child: Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(
                3,
                2,
                0.001,
              )
              ..translate(
                  0.0,
                  verticalFactor *
                      animation.value *
                      MediaQuery.of(context).size.height,
                  depth * depthFactor),
            child: InkWell(
              onTap: () {
                onCardSelected(card);
              },
              child: SizedBox(
                height: height,
                child: Card3dWidget(card: card),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
