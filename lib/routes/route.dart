import 'package:get/get.dart';
import 'package:technical_assignment/models/post_model.dart';
class RoutePage {
  // Use a static method to perform navigation
  void goToHomeScreen() {
    Get.toNamed("/HomeScreen");
  }
   void goToPostDetailScreen({required PostModel post}) {
    Get.toNamed("/PostDetailsScreen",arguments: post);
  }
}


