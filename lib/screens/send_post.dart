import 'package:flutter/material.dart';
import 'package:tester_api/controllers/app_controller.dart';
import 'package:tester_api/models/post.dart';

class SendPost extends StatelessWidget {
  SendPost({Key? key}) : super(key: key);
  final TextEditingController titleController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Post'),
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 8, right: 8),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                  hintText: 'title.......', labelText: 'Post Title'),
            ),
            TextField(
              controller: bodyController,
              decoration: const InputDecoration(
                  hintText: 'body.......', labelText: 'Post Body'),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () async {
                var newPost = Post(
                  userId: 2,
                  title: titleController.text,
                  body: bodyController.text,
                );
                await AppController.createPost(body: newPost.tojson());
              },
              child: const Text('Create'),
            )
          ],
        ),
      ),
    );
  }
}
