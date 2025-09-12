import 'package:flutter/material.dart';
import 'package:technical_assignment/controllers/home_controller.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  final HomeController controller = Get.put(HomeController());
   HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Text('Welcome to the Home Screen!'),
      ),
    );
  }
}