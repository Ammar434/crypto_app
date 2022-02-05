import 'package:flutter/material.dart';

class SpecialUser extends StatelessWidget {
  const SpecialUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text("VIP"),
      ),
    );
  }
}
