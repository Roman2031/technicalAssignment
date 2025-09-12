import 'package:flutter/material.dart';
import 'package:technical_assignment/models/post_model.dart';

class PostDetailScreen extends StatefulWidget {
PostModel post;
   PostDetailScreen({super.key, required this.post});

  @override
  State<PostDetailScreen> createState() => _PostDetailsScreenState();
}

class _PostDetailsScreenState extends State<PostDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post Details'),
      ),
      body: Padding(
        padding: EdgeInsets.only(left:8,right: 8),
        child: Center(
          child: Column(
            children: [
              Column(
                    children: [
                      Text('User Id: ${widget.post.userId.toString()}'),
                      Text('Id: ${widget.post.id.toString()}'),
                      SizedBox(height: 10),
                      Text('${widget.post.title.toString()}', style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(height: 10),
                      Text('${widget.post.body.toString()}',textAlign: TextAlign.justify),
                      SizedBox(height: 10), 
                      ElevatedButton(
                    onPressed: () {
                    },
                    child:  Text('Download File'),
                  )              
                    ],
                  ),
            ],
          ),
        ),
      ),
    );
  }
}