import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/comments.dart';

class CommentsScreen extends StatefulWidget {
  @override
  _CommentsScreenState createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  List<Comments> commentsList = [];

  Future<List<Comments>> getComments() async {
    final Url = "https://jsonplaceholder.typicode.com/comments";
    final response = await http.get(Uri.parse(Url));
    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body) as List;
      commentsList = responseData.map((e) => Comments.fromJSON(e)).toList();
      return commentsList;
    } else {
      throw Exception("Failed To Get Comments");
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text("Get Comments")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: FutureBuilder(
          future: getComments(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: commentsList.length,
                itemBuilder: (context, index) {
                  final comments = snapshot.data!;
                  final Comments = comments[index];
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 13.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Name",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.orange,
                            ),
                          ),
                          Text(Comments.name),
                          Text(
                            "Email",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.orange,
                            ),
                          ),
                          Text(Comments.email),
                          Text(
                            "Description",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.orange,
                            ),
                          ),
                          Text(Comments.body),
                        ],
                      ),
                    ),
                  );
                },
              );
            } else {
              return Text("No Data Found");
            }
          },
        ),
      ),
    );
  }
}
