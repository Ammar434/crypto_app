import 'package:crypto_app/responsive/size_config.dart';
import 'package:crypto_app/screens/home/cards/cards_home.dart';
import 'package:crypto_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import 'menu_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => new _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _drawerController = ZoomDrawerController();

  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      controller: _drawerController,
      menuScreen: const MenuScreen(),
      mainScreen: const MainScreen(),
      openCurve: Curves.fastOutSlowIn,
      borderRadius: defaultRadius,
      showShadow: true,
      mainScreenScale: .3,
      angle: 0.0,
      swipeOffset: 2.0,
      slideWidth: SizeConfig.widthMultiplier * 55,
      mainScreenTapClose: true,
      boxShadow: const [BoxShadow(color: Colors.black87, blurRadius: 12)],
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<DrawerState>(
      valueListenable: ZoomDrawer.of(context)!.stateNotifier!,
      builder: (context, state, child) {
        return AbsorbPointer(
          absorbing: state != DrawerState.closed,
          child: child,
        );
      },
      child: GestureDetector(
        child: const CardsHome(),
        onPanUpdate: (details) {
          if (details.delta.dx < 6) {
            ZoomDrawer.of(context)?.toggle.call();
          }
        },
      ),
    );
  }
}
