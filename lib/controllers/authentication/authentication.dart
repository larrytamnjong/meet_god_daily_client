import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:meet_god_daily_client/data/authentication.dart';

import '../../models/user.dart';

class AuthenticationController extends GetxController {
  final phone = TextEditingController();
  final email = TextEditingController();
  final fullName = TextEditingController();
  final password = TextEditingController();
  final repeatPassword = TextEditingController();

  final formKey = GlobalKey<FormBuilderState>();
  late AuthenticationClient authenticationClient;

  void registerUser() async {
    if (formKey.currentState!.validate()) {
      User user = User(
          phone: phone.text,
          email: email.text,
          fullName: fullName.text,
          password: password.text);
      authenticationClient = AuthenticationClient(user: user);
      bool isSuccess = await authenticationClient.register();
      if (isSuccess) {
        debugPrint("success");
      } else {
        debugPrint("Failure");
      }
    }
  }

  void logUserIn() async {
    if (formKey.currentState!.validate()) {
      User user = User(phone: phone.text, password: password.text);
      authenticationClient = AuthenticationClient(user: user);
      User? loggedUser = await authenticationClient.login();
      if (loggedUser!.id != null) {
        debugPrint("Logged in ${loggedUser.id} ${loggedUser.creationDate}");
      }
    } else {
      debugPrint("Form incomplete");
    }
  }
}
