import 'dart:io';

import 'package:flutter/material.dart';
import 'package:technical_assignment/models/post_model.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:path_provider/path_provider.dart';
import 'package:dio/dio.dart';

class ArticalDetailsScreen extends StatefulWidget {
PostModel post;
   ArticalDetailsScreen({super.key, required this.post});

  @override
  State<ArticalDetailsScreen> createState() => _PostDetailsScreenState();
}
class _PostDetailsScreenState extends State<ArticalDetailsScreen> {
  ValueNotifier downloadProgressNotifier = ValueNotifier(0);
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
                      downloadFileFromServer();
                    },
                    child:  Text('Download File'),
                  ),
                  // show progress indicators using the ValueListenableBuilder
                  ValueListenableBuilder(
                    valueListenable: downloadProgressNotifier,
                    builder: (context, value, child) {
                      final percentValue = (value is num) ? (value.toDouble() / 100.0) : 0.0;
                      final displayText = "${value ?? 0}%";
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [                          
                          SizedBox(
                            height: 32,
                          ),
                          LinearPercentIndicator(
                            // animation: true,
                            barRadius: const Radius.circular(10),
                            // animationDuration: 400,
                            lineHeight: 15.0,
                            percent: percentValue.clamp(0.0, 1.0),
                            backgroundColor: Colors.grey.shade300,
                            progressColor: Colors.blue,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            displayText,
                            style: const TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ),
                        ],
                      );
                    },
                  ),
                    ],
                  ),
            ],
          ),
        ),
      ),
    );
  }
downloadFileFromServer() async {  
    Directory directory = Directory("");
    if (Platform.isAndroid) {
      directory = (await getExternalStorageDirectory())!;
    } else {
      directory = (await getApplicationDocumentsDirectory());
    }
    await Dio().download(
        "https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf",
        '${directory.path}/dummy.pdf',
        onReceiveProgress: (actualBytes, int totalBytes) {
      downloadProgressNotifier.value = (actualBytes / totalBytes * 100).floor();
    });
    print('File downloaded at ${directory.path}/dummy.pdf');
  }
  
} 