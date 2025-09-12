import 'package:get/get.dart';
import 'package:technical_assignment/models/post_model.dart';
import 'package:technical_assignment/views/artical_list_screen.dart';
import 'package:technical_assignment/views/login_screen.dart';
import 'package:technical_assignment/views/artical_details_screen.dart';

List<GetPage<dynamic>>? appRoutes({required String? token}) {
  return [    
    GetPage(name: '/', page: () => token != null ? ArticalListScreen(): LoginScreen()),
    GetPage(name: '/ArticalListScreen', page: () => ArticalListScreen()),
    GetPage(name: '/ArticalDetailsScreen', page: () => ArticalDetailsScreen(post: Get.arguments as PostModel)),
  ];
}