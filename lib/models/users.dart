import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String email;
  final String uid;
  final String level;
  final String dayLeft;

  const User({
    required this.uid,
    required this.email,
    required this.dayLeft,
    required this.level,
  });

  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return User(
      uid: snapshot["uid"],
      email: snapshot["email"],
      dayLeft: snapshot["dayLeft"],
      level: snapshot["level"],
    );
  }

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "email": email,
        "dayLeft": dayLeft,
        "level": level,
      };
}
