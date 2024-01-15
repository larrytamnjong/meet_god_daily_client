import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

class AuthenticationController extends GetxController {
  final phone = TextEditingController();
  final email = TextEditingController();
  final fullName = TextEditingController();
  final password = TextEditingController();
  final repeatPassword = TextEditingController();

  final formKey = GlobalKey<FormBuilderState>();

  void registerUser() {
    if (formKey.currentState!.validate() &&
        password.toString() == repeatPassword.toString()) {
      debugPrint("Registering user");
    } else {
      debugPrint("Form not complete");
    }
  }

  void logUserIn() {
    if (formKey.currentState!.validate()) {
      debugPrint("Logging user in");
    } else {
      debugPrint("Form incomplete");
    }
  }
}
