import 'package:crypto_app/models/history_model.dart';
import 'package:flutter/material.dart';

import 'notification_tile.dart';

class BuildNotificationTile extends StatelessWidget {
  const BuildNotificationTile({
    Key? key,
    required this.list,
  }) : super(key: key);
  final List<HistoryModel> list;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) => NotificationTile(
        tp: list[index].tp,
        buy: list[index].buy,
        sl: list[index].sl,
        pe: list[index].pe, image: list[index].image,
      ),
    );
  }
}
