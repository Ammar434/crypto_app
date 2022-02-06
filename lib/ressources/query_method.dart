import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto_app/models/history_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';

class QueryFromFirebase {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<List<HistoryModel>> getHistoryOfCall() async {
    List<HistoryModel> listHistoryModel = [];
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await _firestore.collection("callHistory").get();
    for (var element in querySnapshot.docs) {
      String image = element.data()['image'];
      String buy = element.data()['buy'];
      String sl = element.data()['sl'];
      String tp = element.data()['tp'];
      String pe = element.data()['pe'];
      HistoryModel historyModel =
          HistoryModel(image: image, buy: buy, sl: sl, pe: pe, tp: tp);
      listHistoryModel.add(historyModel);
    }
    return listHistoryModel;
  }

  Future<String> updatePropFirm(
      String packName, String propFirm, String transactionId) async {
    String res = "Some error Occurred";
    String? email = _auth.currentUser?.email;
    DateTime dateToday = Timestamp.now().toDate();
    String date = DateFormat('dd-MM-yyyy').format(dateToday);

    try {
      if (propFirm.isNotEmpty) {
        if (email != null) {
          await _firestore
              .collection("users")
              .doc(email)
              .collection("packSouscrit")
              .add(
            {
              "name": packName,
              "propFirm": propFirm,
              "dateSouscription": date,
              "transactionId": transactionId,
            },
          );
        }
        res = "success";
      } else {
        res = "Merci de refaire l'operation";
      }
    } catch (err) {
      return err.toString();
    }
    return res;
  }

  Future<String> buySubscription(String transactionId) async {
    String res = "Some error Occurred";
    String? email = _auth.currentUser?.email;
    DateTime dateToday = Timestamp.now().toDate();
    String date = DateFormat('dd-MM-yyyy').format(dateToday);

    try {
      if (email != null) {
        await _firestore
            .collection("users")
            .doc(email)
            .collection("academySubscription")
            .add(
          {
            "dateSouscription": date,
            "transactionId": transactionId,
          },
        );
        res = "success";
      } else {
        res = "Merci de refaire l'operation";
      }
    } catch (err) {
      return err.toString();
    }
    return res;
  }

  Future<String> updateUserNumberPackBuy() async {
    String res = "Some error Occurred";
    String? email = _auth.currentUser?.email;

    try {
      if (email != null) {
        await _firestore.collection("users").doc(email).update(
          {
            'numberPackBuy': FieldValue.increment(1),
          },
        );
        res = "success";
      } else {
        res = "Merci de refaire l'operation";
      }
    } catch (err) {
      return err.toString();
    }
    return res;
  }

  Future<int?> getUserNumberPackBuy() async {
    String? email = _auth.currentUser?.email;
    DocumentSnapshot documentSnapshot;
    try {
      if (email != null) {
        documentSnapshot =
            await _firestore.collection("users").doc(email).get();

        return documentSnapshot['numberPackBuy'];
      } else {}
    } catch (err) {
      return -1;
    }
  }
}
