// ignore_for_file: depend_on_referenced_packages, prefer_const_constructors_in_immutables, avoid_print
import 'package:flutter/material.dart';
import 'package:technical_assignment/routes/navigate_route.dart';
import 'package:get/get.dart';

AppBar customAppBar({required RxString title, required bool showSettings}) {
  return AppBar(
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Obx(() => Text('$title')),
        showSettings == true ? GestureDetector(
          child: Text('Settings'),
          onTap: () => {NavigateRoute.goToSettingsScreen()},
        ): SizedBox.shrink(),
      ],
    ),
  );
}
