import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String email;
  final String uid;
  final String level;
  final int dayLeft;
  final String address;
  final String phoneNumber;
  final bool specialUser;
  final int numberPackBuy;

  final String dateJoined;
  const User({
    required this.uid,
    required this.email,
    required this.dayLeft,
    required this.level,
    required this.address,
    required this.phoneNumber,
    required this.specialUser,
    required this.dateJoined,
    required this.numberPackBuy,
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
        dateJoined: snapshot["dateJoined"],
        numberPackBuy: snapshot["numberPackBuy"]);
  }

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "email": email,
        "dayLeft": dayLeft,
        "level": level,
        "address": address,
        "phoneNumber": phoneNumber,
        "specialUser": specialUser,
        "dateJoined": dateJoined,
        "numberPackBuy": numberPackBuy,
      };
}
