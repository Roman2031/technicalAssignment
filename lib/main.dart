// ignore_for_file: depend_on_referenced_packages, must_be_immutable,avoid_print
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:technical_assignment/routes/all_routes.dart';


void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final getStorage = GetStorage();
    bool isDarkModeTheme = getStorage.read('isDarkMode') ?? false;
    return GetMaterialApp(
      theme: isDarkModeTheme == true ? ThemeData.dark() : ThemeData.light(),
      initialRoute: '/',
      getPages: allRoutes(token: getStorage.read('token')),
      debugShowCheckedModeBanner: false,
    );
  }
}
