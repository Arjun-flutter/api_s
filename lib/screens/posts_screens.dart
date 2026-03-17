import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/posts.dart';


class PostsScreens extends StatefulWidget {
  @override
  _PostsScreensState createState() => _PostsScreensState();
}

class _PostsScreensState extends State<PostsScreens> {
  List<Post> postList = [];

  Future<List<Post>> getPosts() async {
    final response = await http.get(
      Uri.parse("https://jsonplaceholder.typicode.com/posts"),
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      postList.clear();
      for(final i in data) {
        postList.add(Post.fromJson(i));
      }
      return postList;
    } else {
      throw Exception("Failed to Load");
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text("Get Posts")),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: FutureBuilder(
          future: getPosts(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                  child: Text("Loading"));
            } else {
              return ListView.builder(
                itemCount: postList.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            postList[index].id.toString(),
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.orange,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "Title",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(postList[index].title.toString()),
                          SizedBox(height: 5),
                          Text(
                            "Description",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(postList[index].body.toString()),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
