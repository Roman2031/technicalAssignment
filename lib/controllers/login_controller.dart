import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:technical_assignment/models/user_model.dart';
import 'package:technical_assignment/services/login_service.dart';
import 'package:technical_assignment/routes/route.dart';
import 'package:get_storage/get_storage.dart';
import 'package:technical_assignment/routes/route.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController(text: 'eve.holt@reqres.in');
  final passwordController = TextEditingController(text: 'cityslicka');
  final RoutePage route = RoutePage();

  var isLoading = false.obs;

  Future<void> login() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      Get.snackbar('Error', 'Email and password cannot be empty');
      return;
    }

    isLoading.value = true;

    try {
      final loginService = LoginService();
      var userInfo = UserModel(email: email, password: password);
      final token = await loginService.login(userModel: userInfo);

      if (token != null) {
        final getStorage = GetStorage();
        getStorage.write('token', token);
        route.goToArticalListScreen();

        Get.snackbar('Success', 'Token: $token stored successfully');
      } else {
        Get.snackbar('Error', 'Invalid credentials');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
