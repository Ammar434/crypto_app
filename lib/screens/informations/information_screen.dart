import 'package:crypto_app/models/users.dart';
import 'package:crypto_app/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InformationScreen extends StatelessWidget {
  const InformationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User user = Provider.of<UserProvider>(context).getUser;
    debugPrint(user.email);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(user.email),
          Text(user.phoneNumber),
          Text(user.address),
          Text(user.mt4Address),
          Text(user.mt5Address),
          Text(user.level)
        ],
      ),
    );
  }
}
