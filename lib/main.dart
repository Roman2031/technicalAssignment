import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';
// ignore: depend_on_referenced_packages
import 'package:get_storage/get_storage.dart';
import 'package:technical_assignment/routes/appRoutes.dart';
import 'package:technical_assignment/utils/global.dart';


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
    bool isDarkModeTheme = getStorage.read('isDarkMode') ?? false;
    return GetMaterialApp(
      theme: isDarkModeTheme == true ? ThemeData.dark() : ThemeData.light(),
      initialRoute: '/',
      getPages: appRoutes(token: token),
      debugShowCheckedModeBanner: false,
    );
  }
}
