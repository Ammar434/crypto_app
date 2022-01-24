import 'package:crypto_app/screens/home/cards/card_3d_details.dart';
import 'package:crypto_app/utils/cards.dart';
import 'package:crypto_app/utils/constants.dart';
import 'package:flutter/material.dart';

import 'card_3d_item.dart';

class CardsBody extends StatefulWidget {
  const CardsBody({Key? key}) : super(key: key);

  @override
  State<CardsBody> createState() => _CardsBodyState();
}

class _CardsBodyState extends State<CardsBody> with TickerProviderStateMixin {
  bool _selectedMode = false;
  late int _selectedIndex = 0;
  late AnimationController _animationControllerSelection;
  late AnimationController _animationControllerMovement;
  @override
  void initState() {
    super.initState();
    _animationControllerSelection = AnimationController(
      vsync: this,
      lowerBound: 0.1,
      upperBound: 0.4,
      duration: defaultDuration,
    );
    _animationControllerMovement = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 880),
    );
  }

  @override
  void dispose() {
    _animationControllerSelection.dispose();
    _animationControllerMovement.dispose();
    super.dispose();
  }

  Future<void> _onCardSelected(Card3d card, int index) async {
    setState(() {
      _selectedIndex = index;
    });
    const duration = Duration(milliseconds: 750);
    _animationControllerMovement.forward();
    await Navigator.of(context).push(
      PageRouteBuilder(
        transitionDuration: duration,
        reverseTransitionDuration: duration,
        pageBuilder: (context, animation, _) => FadeTransition(
          opacity: animation,
          child: CardsDetails(card: card),
        ),
      ),
    );
    _animationControllerMovement.reverse(from: 1.0);
  }

  int _getCurrentFactor(int currentIndex) {
    if (_selectedIndex == currentIndex) {
      return 0;
    } else if (currentIndex > _selectedIndex) {
      return -1;
    }
    return 1;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return AnimatedBuilder(
          animation: _animationControllerSelection,
          builder: (context, snapshot) {
            final selectionValue = _animationControllerSelection.value;
            return GestureDetector(
              onTap: () {
                if (!_selectedMode) {
                  _animationControllerSelection.forward().whenComplete(
                    () {
                      setState(
                        () {
                          _selectedMode = true;
                        },
                      );
                    },
                  );
                } else {
                  _animationControllerSelection.reverse().whenComplete(() {
                    setState(() {
                      _selectedMode = false;
                    });
                  });
                }
              },
              child: Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..rotateX(selectionValue),
                child: AbsorbPointer(
                  absorbing: !_selectedMode,
                  child: Container(
                    color: Colors.transparent,
                    height: constraints.maxHeight,
                    width: constraints.maxWidth * 0.55,
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        ...List.generate(
                          cardList.length,
                          (index) => Card3dItem(
                            height: constraints.maxHeight / 2.5,
                            card: cardList[index],
                            percent: selectionValue,
                            depth: index,
                            onCardSelected: (Card3d card) {
                              _onCardSelected(card, index);
                            },
                            verticalFactor: _getCurrentFactor(index),
                            animation: _animationControllerMovement,
                          ),
                        ).reversed.toList(),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
