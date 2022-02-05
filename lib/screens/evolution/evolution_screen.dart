import 'package:flutter/material.dart';

class EvolutionScreen extends StatelessWidget {
  const EvolutionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text("Mon evolution"),
      ),
    );
  }
}
