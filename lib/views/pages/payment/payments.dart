import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meet_god_daily_client/controllers/payment/payment.dart';
import 'package:meet_god_daily_client/views/pages/payment/make_payment.dart';
import 'package:meet_god_daily_client/views/widgets/styles/text_styles.dart';
import 'package:meet_god_daily_client/views/widgets/widgets/errors.dart';

import '../../../models/payments.dart';

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({super.key});

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  PaymentController paymentController = PaymentController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green.withOpacity(0.5),
        tooltip: "Make payment to subscribe",
        isExtended: true,
        onPressed: () {
          Get.to(() => const MakePaymentPage());
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      appBar: AppBar(
        title: const AppBarTitle(title: "Subscriptions"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder<List<Payment>?>(
            future: paymentController.getPayments(),
            builder: (context, payments) {
              if (payments.hasData) {
                return ListView.builder(
                    itemCount: payments.data?.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        child: ListTile(
                          leading: const Icon(Icons.currency_franc_outlined),
                          title: Text(
                            payments.data![index].creationDate!,
                            style: mediumTextStyle,
                          ),
                          subtitle: Text(
                            payments.data![index].txRef!,
                            style: mediumTextStyle,
                          ),
                          trailing: Text(
                            payments.data![index].status!,
                            style: mediumTextStyle.copyWith(
                                color:
                                    payments.data![index].status == "complete"
                                        ? Colors.green
                                        : Colors.orange),
                          ),
                        ),
                      );
                    });
              } else if (payments.hasError) {
                return const InternalError();
              } else if (payments.connectionState == ConnectionState.waiting) {
                return const LinearProgressIndicator();
              } else {
                return const InternalError();
              }
            }),
      ),
    );
  }
}
