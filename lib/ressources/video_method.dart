import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class VideoMethod {
  FirebaseDatabase database = FirebaseDatabase.instance;

  static Future<Object?> getVideoFromLevel({required int level}) async {
    DatabaseReference videoReference =
        FirebaseDatabase.instance.ref("niveau/$level/video");

    DatabaseEvent event = await videoReference.once();
    // VideoModel videoModel = VideoModel.fromJson(event, index);
    return event.snapshot.value;
  }

  static Future<String> getLevelTitle({required int level}) async {
    DatabaseReference databaseReference =
        FirebaseDatabase.instance.ref("niveau/$level/levelName");

    DatabaseEvent event = await databaseReference.once();
    debugPrint(event.snapshot.value.toString());

    debugPrint(event.snapshot.value.toString());
    return (event.snapshot.value.toString());
  }
}
