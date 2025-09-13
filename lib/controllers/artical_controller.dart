import 'package:get/get.dart';
import 'package:technical_assignment/models/post_model.dart';
import 'package:technical_assignment/services/artical_services.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class ArticalController extends GetxController {
  late final pagingController = PagingController<int, PostModel>(
    getNextPageKey: (state) => state.lastPageIsEmpty ? null : state.nextIntPageKey,
    fetchPage: (pageKey) {
      return postList();},
    );
   Future<List<PostModel>> postList() async {
    final articalServices = ArticalServices();
    List<PostModel> getPosts = await articalServices.postList();
    return getPosts;
   }
}