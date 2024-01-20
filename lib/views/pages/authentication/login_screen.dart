import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:meet_god_daily_client/utils/validator.dart';
import 'package:meet_god_daily_client/views/widgets/styles/text_styles.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../controllers/authentication/authentication.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late AuthenticationController authenticationController;
  @override
  void initState() {
    authenticationController = Get.put(AuthenticationController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login',
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
                      "Fill in your details below to sign in and connect with God",
                      style: mediumTextStyle,
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    FormBuilderTextField(
                      name: "Phone number",
                      decoration:
                          const InputDecoration(labelText: 'Phone number'),
                      keyboardType: TextInputType.phone,
                      validator: phoneValidator,
                      controller: authenticationController.phone,
                    ),
                    FormBuilderTextField(
                      obscureText: true,
                      name: "Password",
                      decoration: const InputDecoration(labelText: 'Password'),
                      keyboardType: TextInputType.text,
                      validator: requiredValidator,
                      controller: authenticationController.password,
                    ),
                    const SizedBox(
                      height: 25.0,
                    ),
                    ElevatedButton(
                        onPressed: authenticationController.logUserIn,
                        child: const Text("Login")),
                    TextButton(
                        onPressed: () {}, child: const Text('Forgot password?'))
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
