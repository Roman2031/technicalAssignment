import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:technical_assignment/models/post_model.dart';
import 'package:technical_assignment/services/home_services.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class HomeController extends GetxController {
  late final pagingController = PagingController<int, PostModel>(
    getNextPageKey: (state) => state.lastPageIsEmpty ? null : state.nextIntPageKey,
    fetchPage: (pageKey) {
      return postList();},
    );
   Future<List<PostModel>> postList() async {
    final homeServices = HomeServices();
    List<PostModel> getPosts = await homeServices.postList();
    return getPosts;
   }
}