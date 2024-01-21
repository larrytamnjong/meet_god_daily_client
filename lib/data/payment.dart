import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:meet_god_daily_client/constants/api_urls.dart';

import '../../models/payments.dart';

class PaymentClient {
  Future<List<Payment>?> getPayments({required String? userId}) async {
    try {
      final response = await http.get(Uri.parse('$payment$userId'));
      if (response.statusCode == 200) {
        List<dynamic> payments = jsonDecode(response.body);

        return payments.map((e) => Payment.fromJson(e)).toList();
      } else {
        return null;
      }
    } catch (exception) {
      return null;
    }
  }

  Future<String?> initiatePayment(
      {required String id, required String phone}) async {
    try {
      final response = await http.post(Uri.parse(initiatePaymentUrl),
          body: {'id': id, 'phone': phone});
      if (response.statusCode == 200) {
        final paymentResponse = jsonDecode(response.body);

        return paymentResponse['message'];
      } else {
        return null;
      }
    } catch (exception) {
      return null;
    }
  }
}
