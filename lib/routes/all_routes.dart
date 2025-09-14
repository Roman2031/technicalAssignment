// ignore_for_file: depend_on_referenced_packages, must_be_immutable,avoid_print
import 'package:get/get.dart';
import 'package:technical_assignment/models/article_model.dart';
import 'package:technical_assignment/views/article_details_screen.dart';
import 'package:technical_assignment/views/article_list_screen.dart';
import 'package:technical_assignment/views/login_screen.dart';
import 'package:technical_assignment/views/settings_screen.dart';

List<GetPage<dynamic>>? allRoutes({required String? token}) {
  return [    
    GetPage(name: '/', page: () => token != null ? ArticalListScreen(): LoginScreen()),
    GetPage(name: '/ArticalListScreen', page: () => ArticalListScreen()),
    GetPage(name: '/ArticleDetailsScreen', page: () => ArticleDetailsScreen(article: Get.arguments as ArticleModel)),
    GetPage(name: '/SettingsScreen', page: () => SettingsScreen()),
  ];
}