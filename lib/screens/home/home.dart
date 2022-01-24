import 'package:crypto_app/utils/colors.dart';
import 'package:crypto_app/widget/drawer_item.dart';
import 'package:crypto_app/widget/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'cards/cards_home.dart';

class Home extends GetView<MyDrawerController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyDrawerController>(
      builder: (_) => ZoomDrawer(
        controller: _.zoomDrawerController,
        menuScreen: const MenuScreen(),
        mainScreen: const MainScreen(),
        borderRadius: 24.0,
        showShadow: true,
        angle: -12.0,
        backgroundColor: Colors.grey,
        slideWidth: MediaQuery.of(context).size.width * 0.45,
      ),
    );
  }
}

class MenuScreen extends GetView<MyDrawerController> {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: thirdColor,
        padding: const EdgeInsets.symmetric(vertical: 100),
        child: ListView(
          children: [
            DrawerItem(text: "Home", iconData: Icons.home, press: () {}),
            DrawerItem(
                text: "Mes informations",
                iconData: FontAwesomeIcons.home,
                press: () {}),
            DrawerItem(
                text: "Mes factures",
                iconData: FontAwesomeIcons.moneyBill,
                press: () {}),
            DrawerItem(
                text: "Mes documents",
                iconData: FontAwesomeIcons.idCardAlt,
                press: () {}),
            DrawerItem(
                text: "Mes retraits",
                iconData: FontAwesomeIcons.coins,
                press: () {}),
            DrawerItem(
                text: "Mon évolution",
                iconData: FontAwesomeIcons.chartLine,
                press: () {}),
            DrawerItem(
              text: "Mes packs",
              iconData: FontAwesomeIcons.boxOpen,
              press: () {},
            ),
            DrawerItem(
              text: "Parametres",
              iconData: FontAwesomeIcons.cog,
              press: () {},
            ),
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 200.0),
              child: RoundedButton(onTap: () {}, text: "Nous conctatez"),
            )
          ],
        ),
      ),
    );
  }
}

class MainScreen extends GetView<MyDrawerController> {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CardsHome(onTap: controller.toggleDrawer);
  }
}

class MyDrawerController extends GetxController {
  final zoomDrawerController = ZoomDrawerController();

  void toggleDrawer() {
    zoomDrawerController.toggle?.call();
    update();
  }
}
