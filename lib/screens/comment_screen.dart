import 'package:flutter/material.dart';
import 'package:tester_api/controllers/app_controller.dart';
import 'package:tester_api/models/comment.dart';
import 'package:tester_api/models/post.dart';

class CommentScreen extends StatefulWidget {
  final int postId;
  const CommentScreen({required this.postId, Key? key}) : super(key: key);

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  List<Comment> commentDataList = [];
  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      try {
        var commentData =
            await AppController.getComments(postId: widget.postId);
        setState(() {
          commentDataList = commentData;
        });
      } catch (e) {
        print(e);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Comment Screen'),
      ),
      body: commentDataList.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: commentDataList.length,
              itemBuilder: (context, index) => ListTile(
                    title: Text(commentDataList[index].email.toString()),
                    subtitle: Text(
                      commentDataList[index].body.toString(),
                      softWrap: false,
                      overflow: TextOverflow.ellipsis,
                    ),
                  )),
    );
  }
}
