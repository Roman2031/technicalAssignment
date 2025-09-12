import 'package:get/get.dart';
import 'package:technical_assignment/models/post_model.dart';
import 'package:technical_assignment/views/home_screen.dart';
import 'package:technical_assignment/views/login_screen.dart';
import 'package:technical_assignment/views/post_details_screen.dart';

List<GetPage<dynamic>>? appRoutes({required String? token}) {
  return [    
    GetPage(name: '/', page: () => token != null ? HomeScreen(): LoginScreen()),
    GetPage(name: '/HomeScreen', page: () => HomeScreen()),
    GetPage(name: '/PostDetailsScreen', page: () => PostDetailScreen(post: Get.arguments as PostModel)),
  ];
}