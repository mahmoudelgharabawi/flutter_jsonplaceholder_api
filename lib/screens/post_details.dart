import 'dart:js';

import 'package:flutter/material.dart';
import 'package:tester_api/models/post.dart';
import 'package:tester_api/screens/comment_screen.dart';

class PostDetail extends StatelessWidget {
  final Post post;
  const PostDetail({required this.post, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(post.title!),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ListTile(
                title: const Text('Title'),
                subtitle: Text(post.title!),
              ),
              ListTile(
                title: const Text('ID'),
                subtitle: Text('${post.id}'),
              ),
              ListTile(
                title: const Text('Body'),
                subtitle: Text(post.body!),
              ),
              ListTile(
                title: const Text('User ID'),
                subtitle: Text('${post.userId}'),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return CommentScreen(
                          postId: post.id!,
                        );
                      }));
                    },
                    child: const Text('See Comments')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
