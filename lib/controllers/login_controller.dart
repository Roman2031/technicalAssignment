import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:technical_assignment/models/user_model.dart';
import 'package:technical_assignment/services/login_service.dart';


class LoginController extends GetxController {
  final emailController = TextEditingController(text: 'eve.holt@reqres.in');
  final passwordController = TextEditingController(text: 'cityslicka');

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
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('reqres-free-v1', token);

        Get.snackbar('Success', 'Login successful! Token saved.');
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
