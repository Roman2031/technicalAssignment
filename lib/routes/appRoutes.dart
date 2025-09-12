import 'package:get/get.dart';
import 'package:technical_assignment/views/home_screen.dart';
import 'package:technical_assignment/views/login_screen.dart';

List<GetPage<dynamic>>? appRoutes({required String? token}) {
  return [    
    GetPage(name: '/', page: () => token != null ? HomeScreen(): LoginScreen()),
    GetPage(name: '/HomeScreen', page: () => HomeScreen()),
  ];
}