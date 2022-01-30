import 'package:flutter/material.dart';

class DocumentScreen extends StatelessWidget {
  const DocumentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text("Mes documents"),
      ),
    );
  }
}
