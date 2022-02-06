import 'dart:convert';

class PaymentCryptoModel {
  final int id;
  final String status;
  final String priceCurrency;
  final String receiveAmount;
  final String paymentUrl;
  final String priceAmount;
  final String receiveCurrency;

  PaymentCryptoModel({
    required this.id,
    required this.status,
    required this.priceCurrency,
    required this.receiveAmount,
    required this.paymentUrl,
    required this.priceAmount,
    required this.receiveCurrency,
  });
  static PaymentCryptoModel fromApi(String response) {
    var data = json.decode(response.toString());
    return PaymentCryptoModel(
      id: data["id"],
      priceCurrency: data["price_currency"],
      paymentUrl: data["payment_url"],
      status: data["status"],
      receiveAmount: data["receive_amount"],
      priceAmount: data['price_amount'],
      receiveCurrency: data['receive_currency'],
    );
  }
}
