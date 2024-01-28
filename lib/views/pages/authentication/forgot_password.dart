import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:meet_god_daily_client/views/widgets/styles/text_styles.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../controllers/authentication/authentication.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  late AuthenticationController authenticationController;

  @override
  void initState() {
    authenticationController = Get.put(AuthenticationController());
    authenticationController.checkWhatsAppInstalled();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'WhatsApp Login',
          style: fontFamilyOnly.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: Obx(
        () => ModalProgressHUD(
          inAsyncCall: authenticationController.isShowProgressIndicator.value,
          progressIndicator: const CircularProgressIndicator(),
          child: SingleChildScrollView(
            child: FormBuilder(
              key: authenticationController.formKey,
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 12.0),
                    Text(
                      "Hey there warrior!",
                      style: largeHeadingStyle.copyWith(fontSize: 18),
                    ),
                    const SizedBox(height: 12.0),
                    Text(
                      "Please be ready to provide the WhatApp number you used during registration in order to recover your account.",
                      style: mediumTextStyle,
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    const SizedBox(
                      height: 25.0,
                    ),
                    ElevatedButton(
                        onPressed: () async {
                          await authenticationController.startOtpless();
                        },
                        child: const Text("Proceed to Login")),
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
