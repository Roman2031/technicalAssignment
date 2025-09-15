// ignore_for_file: depend_on_referenced_packages, prefer_const_constructors_in_immutables, avoid_print, unnecessary_string_interpolations
import 'package:get/get.dart';
import 'package:technical_assignment/controllers/articale_controller.dart';

class ArticleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ArticleController>(() => ArticleController());
  }
}