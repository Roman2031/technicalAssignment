import 'package:flutter/material.dart';
import 'package:technical_assignment/routes/navigate_route.dart';

AppBar customAppBar({required String title, required bool showSettings}) {
  return AppBar(
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(title),
        showSettings == true ? GestureDetector(
          child: Text('Settings'),
          onTap: () => {NavigateRoute.goToSettingsScreen()},
        ): SizedBox.shrink(),
      ],
    ),
  );
}
