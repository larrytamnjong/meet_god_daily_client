import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:meet_god_daily_client/views/dialogs/snackbars.dart';

import '../../data/payment.dart';
import '../../models/payments.dart';
import '../../utils/shared_preference.dart';

class PaymentController extends GetxController {
  late PaymentClient paymentClient;
  final phone = TextEditingController();
  final formKey = GlobalKey<FormBuilderState>();
  var isMakingPayment = false.obs;
  PaymentController() {
    paymentClient = PaymentClient();
  }

  Future<List<Payment>?> getPayments() async {
    List<Payment>? payments = await paymentClient.getPayments(userId: 7);
    if (payments != null) {
      return payments;
    } else {
      return null;
    }
  }

  void initiatePayment() async {
    String? userId = await SharedPreference.getUserId();
    if (formKey.currentState!.validate()) {
      isMakingPayment.value = true;
      String? status =
          await paymentClient.initiatePayment(id: userId!, phone: phone.text);
      if (status != null) {
        isMakingPayment.value = false;
        showSnackBarSuccess(
            message:
                "Payment was initiated successful, make sure to dial *126# or #150# to complete!");
      } else {
        showSnackBarFailure(message: "Payment was not initiated!");
        isMakingPayment.value = false;
      }
    }
  }
}
