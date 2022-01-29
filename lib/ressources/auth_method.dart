import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import "package:crypto_app/models/users.dart" as model;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class AuthMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // get user details
  Future<model.User> getUserDetails() async {
    User currentUser = _auth.currentUser!;
    DocumentSnapshot documentSnapshot =
        await _firestore.collection('users').doc(currentUser.email).get();

    debugPrint(model.User.fromSnap(documentSnapshot).email);
    return model.User.fromSnap(documentSnapshot);
  }

  // Signing Up User

  Future<String> signUpUser({
    required String email,
    required String password,
    required String passwordConfirm,
    required String address,
    required String phoneNumber,
  }) async {
    String res = "Some error Occurred";
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          address.isNotEmpty ||
          phoneNumber.isNotEmpty ||
          passwordConfirm.isNotEmpty) {
        // registering user in auth with email and password
        if (password != passwordConfirm) {
          return "Mot de passe different";
        }
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        model.User _user = model.User(
          uid: cred.user!.uid,
          email: email,
          dayLeft: "0",
          level: "0",
          address: address,
          phoneNumber: phoneNumber,
          specialUser: false,
          mt4Address: "Non attribué",
          mt5Address: "Non attribué",
          propFirm: "",
        );

        // adding user in our database
        await _firestore.collection("users").doc(email).set(_user.toJson());

        res = "success";
      } else {
        res = "Please enter all the fields";
      }
    } catch (err) {
      return err.toString();
    }
    return res;
  }

  // logging in user
  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String res = "Some error Occurred";
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        // logging in user with email and password
        await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        res = "success";
      } else {
        res = "Please enter all the fields";
      }
    } catch (err) {
      return err.toString();
    }
    return res;
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
