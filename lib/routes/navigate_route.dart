import 'package:get/get.dart';
import 'package:technical_assignment/models/article_model.dart';
class NavigateRoute {
  static void goToLoginScreen() {
    Get.offAllNamed("/LoginScreen");
  }
 static void goToArticleListScreen() {
    Get.offAllNamed("/ArticalListScreen");
  }
  static void goToArticleDetailScreen({required ArticleModel article}) {
    Get.toNamed("/ArticleDetailsScreen",arguments: article);
  }
   static void goToSettingsScreen() {
    Get.toNamed("/SettingsScreen");
  }
}


