import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Subscription {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> updateSubscription(int numberDay) async {
    String res = "Some error Occurred";
    String? email = _auth.currentUser?.email;
    try {
      if (numberDay != 0) {
        if (email != null) {
          await _firestore.collection("users").doc(email).update(
            {
              'dayLeft': FieldValue.increment(numberDay),
            },
          );
        }
        res = "success";
      } else {
        res = "Une erreur dans l'écriture de la base de donnée";
      }
    } catch (err) {
      return err.toString();
    }
    return res;
  }
}
