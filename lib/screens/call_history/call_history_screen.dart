import 'package:crypto_app/models/history_model.dart';
import 'package:crypto_app/ressources/query_method.dart';
import 'package:flutter/material.dart';

import 'build_notification_tile.dart';

class CallHistoryScreen extends StatelessWidget {
  const CallHistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text("Nos derniers calls"),
      ),
      body: FutureBuilder(
        future: QueryFromFirebase().getHistoryOfCall(),
        builder:
            (BuildContext context, AsyncSnapshot<List<HistoryModel>> snapshot) {
          if (snapshot.hasData) {
            return BuildNotificationTile(
              list: snapshot.data!,
            );
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
