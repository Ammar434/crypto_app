import 'package:cloud_firestore/cloud_firestore.dart';
import "package:crypto_app/models/users.dart" as model;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class AuthMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // get user details
  Future<model.User> getUserDetails() async {
    User currentUser = _auth.currentUser!;
    DocumentSnapshot documentSnapshot =
        await _firestore.collection('users').doc(currentUser.email).get();
    // debugPrint(model.User.fromSnap(documentSnapshot).email);
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

        DateTime dateToday = Timestamp.now().toDate();
        String date = DateFormat('dd-MM-yyyy').format(dateToday);
        model.User _user = model.User(
          uid: cred.user!.uid,
          email: email,
          dayLeft: -1,
          level: "0",
          address: address,
          phoneNumber: phoneNumber,
          specialUser: false,
          dateJoined: date,
          numberPackBuy: 0,
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
    email = email.replaceAll(" ", "");

    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        // logging in user with email and password
        debugPrint(email);
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

  Future<String> resetPassword(String email) async {
    String res = "Some error Occurred";
    try {
      if (email.isNotEmpty) {
        await _auth.sendPasswordResetEmail(
          email: email,
        );
        res = "success";
      } else {
        res = "Please enter an email";
      }
    } catch (err) {
      return err.toString();
    }
    return res;
  }

  Future<String> updatePassword(String password, String passwordConfirm) async {
    String res = "Some error Occurred";
    try {
      if (password.isNotEmpty &&
          passwordConfirm.isNotEmpty &&
          password == passwordConfirm) {
        await _auth.currentUser?.updatePassword(password);
        res = "success";
      } else {
        res = "Merci de verifier vos mots de passe";
      }
    } catch (err) {
      return err.toString();
    }
    return res;
  }

  Future<String> updateAddress(String address) async {
    String res = "Some error Occurred";
    String? email = _auth.currentUser?.email;
    try {
      if (address.isNotEmpty) {
        if (email != null) {
          await _firestore.collection("users").doc(email).update(
            {'address': address},
          );
        }
        res = "success";
      } else {
        res = "Merci d'entrer une adresse";
      }
    } catch (err) {
      return err.toString();
    }
    return res;
  }

  Future<String> updatePhoneNumber(String phoneNumber) async {
    String res = "Some error Occurred";
    String? email = _auth.currentUser?.email;
    try {
      if (phoneNumber.isNotEmpty) {
        if (email != null) {
          await _firestore.collection("users").doc(email).update(
            {'phoneNumber': phoneNumber},
          );
        }
        res = "success";
      } else {
        res = "Merci d'entrer un numéro";
      }
    } catch (err) {
      return err.toString();
    }
    return res;
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  Future<void> deleteUser() async {
    await _auth.currentUser?.delete();
  }
}
