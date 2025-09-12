import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:technical_assignment/routes/appRoutes.dart';
import 'package:technical_assignment/views/home_screen.dart';
import 'package:technical_assignment/views/login_screen.dart';


void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final getStorage = GetStorage();
    String? token;
    token = getStorage.read('token');
    return GetMaterialApp(
      initialRoute: '/',
      home: token != null ? HomeScreen() : LoginScreen(),
      getPages: appRoutes(),
      debugShowCheckedModeBanner: false,
    );
  }
}
