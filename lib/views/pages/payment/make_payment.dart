import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:meet_god_daily_client/controllers/payment/payment.dart';
import 'package:meet_god_daily_client/views/widgets/styles/text_styles.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../utils/validator.dart';

class MakePaymentPage extends StatefulWidget {
  const MakePaymentPage({super.key});

  @override
  State<MakePaymentPage> createState() => _MakePaymentPageState();
}

class _MakePaymentPageState extends State<MakePaymentPage> {
  late PaymentController paymentController;

  @override
  void initState() {
    paymentController = Get.put(PaymentController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppBarTitle(title: "Make Payment"),
      ),
      body: Obx(
        () => FormBuilder(
          key: paymentController.formKey,
          child: ModalProgressHUD(
            inAsyncCall: paymentController.isMakingPayment.value,
            child: Center(
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 12.0, right: 12.0, top: 50.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "Please enter you mobile money phone number and click the 'Make payment button' to pay then *126# or #150#. Please note payments may take up to 5 minuets to validate",
                      style: mediumTextStyle,
                      textAlign: TextAlign.center,
                    ),
                    FormBuilderTextField(
                      name: "Phone number",
                      decoration: const InputDecoration(
                          labelText: 'Mobile money number'),
                      keyboardType: TextInputType.phone,
                      validator: phoneValidator,
                      controller: paymentController.phone,
                      //      controller: authenticationController.phone,
                    ),
                    const SizedBox(height: 20.0),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: ElevatedButton(
                          onPressed: paymentController.initiatePayment,
                          child: const Text("Make Payment")),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
