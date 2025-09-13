import 'package:get/get.dart';
import 'package:technical_assignment/models/article_model.dart';
class Navigate {
  // Use a static method to perform navigation
 static void goToArticleListScreen() {
    Get.toNamed("/ArticalListScreen");
  }
  static void goToArticleDetailScreen({required ArticleModel article}) {
    Get.toNamed("/ArticleDetailsScreen",arguments: article);
  }
   static void goToSettingsScreen() {
    Get.toNamed("/SettingsScreen");
  }
}


