import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:technical_assignment/controllers/login_controller.dart';

class LoginScreen extends StatelessWidget {
  final LoginController controller = Get.put(LoginController());

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:  Text('Login')),
      body: Padding(
        padding:  EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: controller.emailController,
              decoration:  InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: controller.passwordController,
              obscureText: true,
              decoration:  InputDecoration(labelText: 'Password'),
            ),
             SizedBox(height: 20),
            Obx(() => controller.isLoading.value
                ?  CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: controller.login,
                    child:  Text('Login'),
                  )),
          ],
        ),
      ),
    );
  }
}
