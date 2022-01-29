import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String email;
  final String uid;
  final String level;
  final String dayLeft;
  final String address;
  final String phoneNumber;
  final bool specialUser;
  final String mt4Address;
  final String mt5Address;
  final String propFirm;
  const User({
    required this.uid,
    required this.email,
    required this.dayLeft,
    required this.level,
    required this.address,
    required this.phoneNumber,
    required this.specialUser,
    required this.mt4Address,
    required this.mt5Address,
    required this.propFirm,
  });

  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return User(
      uid: snapshot["uid"],
      email: snapshot["email"],
      dayLeft: snapshot["dayLeft"],
      level: snapshot["level"],
      address: snapshot["address"],
      phoneNumber: snapshot["phoneNumber"],
      specialUser: snapshot["specialUser"],
      mt4Address: snapshot["mt4Address"],
      mt5Address: snapshot["mt5Address"],
      propFirm: snapshot["propFirm"],
    );
  }

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "email": email,
        "dayLeft": dayLeft,
        "level": level,
        "address": address,
        "phoneNumber": phoneNumber,
        "specialUser": specialUser,
        "mt4Address": mt4Address,
        "mt5Address": mt5Address,
        "propFirm": propFirm,
      };
}
