import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:meet_god_daily_client/controllers/authentication/authentication.dart';
import 'package:meet_god_daily_client/utils/validator.dart';
import 'package:meet_god_daily_client/views/widgets/styles/text_styles.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
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
          "Create Account",
          style: fontFamilyOnly,
        ),
      ),
      body: SingleChildScrollView(
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
                  "Fill in your details below to create an account and connect with God",
                  style: mediumTextStyle,
                ),
                const SizedBox(
                  height: 15.0,
                ),
                FormBuilderTextField(
                  name: "Full name",
                  decoration: const InputDecoration(labelText: 'Full name'),
                  keyboardType: TextInputType.text,
                  controller: authenticationController.fullName,
                  validator: requiredValidator,
                ),
                FormBuilderTextField(
                  name: "Phone number",
                  decoration: const InputDecoration(labelText: 'Phone number'),
                  keyboardType: TextInputType.phone,
                  validator: phoneValidator,
                  controller: authenticationController.phone,
                ),
                FormBuilderTextField(
                  name: "Email",
                  decoration: const InputDecoration(labelText: 'Email'),
                  keyboardType: TextInputType.emailAddress,
                  validator: emailValidator,
                  controller: authenticationController.email,
                ),
                FormBuilderTextField(
                  name: "Password",
                  decoration: const InputDecoration(labelText: 'Password'),
                  keyboardType: TextInputType.text,
                  controller: authenticationController.password,
                  validator: requiredValidator,
                ),
                FormBuilderTextField(
                  name: "Repeat Password",
                  decoration:
                      const InputDecoration(labelText: 'Repeat Password'),
                  keyboardType: TextInputType.text,
                  controller: authenticationController.repeatPassword,
                  validator: requiredValidator,
                ),
                const SizedBox(
                  height: 25.0,
                ),
                ElevatedButton(
                    onPressed: authenticationController.registerUser,
                    child: const Text("Register")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
