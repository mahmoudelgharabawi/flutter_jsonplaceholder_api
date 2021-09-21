import 'dart:js';

import 'package:flutter/material.dart';
import 'package:tester_api/models/post.dart';
import 'package:tester_api/screens/comment_screen.dart';
import 'package:tester_api/screens/post_details.dart';
import 'package:tester_api/screens/send_post.dart';

import 'controllers/app_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      routes: {
        '/': (context) => const MyHome(),
        '/sendPost': (context) => SendPost(),
      },
    );
  }
}

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  List<Post> posDataList = [];
  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      try {
        var posData = await AppController.getPosts();
        setState(() {
          posDataList = posData;
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
        title: const Text('Json PlaceHolder Api'),
        actions: [
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: () {
              Navigator.pushNamed(context, '/sendPost');
            },
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const UserAccountsDrawerHeader(
              accountName: Text("Mahmoud Ahmed"),
              accountEmail: Text("m.elgharabawi3@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  "M",
                  style: TextStyle(fontSize: 40.0),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Home"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text("Settings"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.contacts),
              title: const Text("Contact Us"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: posDataList.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: posDataList.length,
              itemBuilder: (context, index) => ListTile(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              PostDetail(post: posDataList[index]),
                        ),
                      );
                    },
                    title: Text(posDataList[index].title.toString()),
                    subtitle: Text(
                      posDataList[index].body.toString(),
                      softWrap: false,
                      overflow: TextOverflow.ellipsis,
                    ),
                  )),
    );
  }
}
