// ignore_for_file: depend_on_referenced_packages, must_be_immutable,avoid_print
import 'package:get/get.dart';
import 'package:technical_assignment/models/article_model.dart';

class NavigateRoute {
  static void goToArticleListScreen() {
    Get.offAllNamed("/ArticalListScreen");
  }

  static void goToArticleDetailScreen({required ArticleModel article}) {
    Get.toNamed("/ArticleDetailsScreen", arguments: article);
  }

  static void goToSettingsScreen() {
    Get.toNamed("/SettingsScreen");
  }

  static void goToShowPdfScreen({required String path}) {
    Get.toNamed("/ShowPdfScreen", arguments: path);
  }
}
