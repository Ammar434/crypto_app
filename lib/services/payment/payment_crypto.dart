import 'dart:convert';

import 'package:crypto_app/models/payment_crypto_model.dart';
import 'package:crypto_app/ressources/query_method.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PaymentCrypto {
  final String _url = 'https://api-sandbox.coingate.com/v2/orders';
  final String _apiKey = "ue1qW8DUxB7p6pkNrfcdvVKHQZ8xbk8ts-M-yypo";
  static int _orderId = -1;
  Future<String> createOrder(String price) async {
    String res = "Some error occured";
    try {
      final int? orderNum = await QueryFromFirebase().getUserNumberPackBuy();
      final http.Response response = await http.post(
        Uri.parse(_url),
        headers: <String, String>{
          "Authorization": "Token $_apiKey",
          "Content-Type": "application/x-www-form-urlencoded; charset=utf-8",
        },
        body: <String, String>{
          'title': 'Order #$orderNum',
          'price_amount': price,
          'price_currency': 'EUR',
          'receive_currency': 'USDT',
          'order_id': '$orderNum',
        },
      );
      Map<String, dynamic> data = json.decode(response.body);
      _orderId = (data['id']);
      debugPrint(response.body.toString());
    } catch (error) {
      res = error.toString();
    }

    return res;

    // debugPrint(orderId.toString());
  }

  Future<PaymentCryptoModel?> getOrderStatus() async {
    final http.Response response = await http.get(
      Uri.parse("$_url/$_orderId"),
      headers: <String, String>{
        "Authorization": "Token $_apiKey",
      },
    );

    if (response.statusCode == 200) {
      PaymentCryptoModel paymentCryptoModel =
          PaymentCryptoModel.fromApi(response.body);
      return paymentCryptoModel;
    }
    print("Some error");
  }
}
