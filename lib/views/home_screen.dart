import 'package:flutter/material.dart';
import 'package:technical_assignment/controllers/home_controller.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:technical_assignment/models/post_model.dart';

class HomeScreen extends StatefulWidget { 
  final HomeController controller = Get.put(HomeController());  
   HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<PostModel> postList = []; 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: RefreshIndicator(
        color: Colors.white,
        backgroundColor: Colors.blue,
        onRefresh: () async {
        widget.controller.postList().then((values) {
      if (!mounted) return;
      setState(() {
        postList = values;
         widget.controller.pagingController.refresh();        
        print('refesh page with posts list length: ${values.length}');
      });
    });
          return Future<void>.delayed(Duration(seconds: 2));
        },
        child: PagingListener(
            controller: widget.controller.pagingController,
            builder: (context, state, fetchNextPage) => PagedListView<int, dynamic>(
        state: state,
        fetchNextPage: fetchNextPage,
        builderDelegate: PagedChildBuilderDelegate(
          itemBuilder: (context, item, index) {
            final post = item as PostModel;
            return Card(
              child: ListTile(
                title: Row(
                  children: [
                    Text('User Id: ${post.userId.toString()}'),
                    SizedBox(width: 10),
                    Text('Id: ${post.id.toString()}'),
                  ],
                ),
                subtitle: Column(
                  children: [
                     Text('Title: ${post.title.toString()}', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('Body: ${post.body.toString()}'),
                  ],
                ),
              ),
            );
          },
        ),
            ),
            ),
      ),
    );
  }
}