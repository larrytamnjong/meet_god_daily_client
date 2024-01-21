import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:meet_god_daily_client/data/authentication.dart';
import 'package:meet_god_daily_client/utils/shared_preference.dart';
import 'package:meet_god_daily_client/views/dialogs/snackbars.dart';
import 'package:meet_god_daily_client/views/pages/authentication/login_screen.dart';

import '../../models/user.dart';
import '../../views/pages/dashboard/dashboard.dart';

class AuthenticationController extends GetxController {
  final phone = TextEditingController();
  final email = TextEditingController();
  final fullName = TextEditingController();
  final password = TextEditingController();
  final repeatPassword = TextEditingController();

  var isShowProgressIndicator = false.obs;
  final formKey = GlobalKey<FormBuilderState>();
  late AuthenticationClient authenticationClient;

  @override
  void dispose() {
    phone.dispose();
    email.dispose();
    fullName.dispose();
    password.dispose();
    repeatPassword.dispose();
    super.dispose();
  }

  void registerUser() async {
    if (formKey.currentState!.validate()) {
      _startProgressIndicator();
      User user = User(
          phone: phone.text,
          email: email.text,
          fullName: fullName.text,
          password: password.text);
      authenticationClient = AuthenticationClient(user: user);
      bool isSuccess = await authenticationClient.register();
      if (isSuccess) {
        _stopProgressIndicator();
        showSnackBarSuccess(message: "You have been registered successfully!");
        Get.off(() => const LoginScreen());
      } else {
        _stopProgressIndicator();
        showSnackBarFailure(
            message:
                "Oops Please check you network connection or user already exist");
      }
    }
  }

  void logUserIn() async {
    if (formKey.currentState!.validate()) {
      _startProgressIndicator();
      User user = User(phone: phone.text, password: password.text);
      authenticationClient = AuthenticationClient(user: user);
      User? loggedUser = await authenticationClient.login();
      if (loggedUser != null) {
        _stopProgressIndicator();
        await SharedPreference.addToSharedPreferences(loggedUser);
        Get.offAll(() => const DashboardScreen());
      } else {
        _stopProgressIndicator();
        showSnackBarFailure(
            message:
                "Oops please check your login details or network connection");
      }
    }
  }

  Future<User?> loadLoggedInUser() async {
    User? user = await SharedPreference.getUserFromSharedPreference();

    return user;
  }

  logOutUser() async {
    await SharedPreference.logOutUser();
  }

  void _startProgressIndicator() {
    isShowProgressIndicator.value = true;
  }

  void _stopProgressIndicator() {
    isShowProgressIndicator.value = false;
  }
}
