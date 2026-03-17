import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class updateUser extends StatefulWidget {
  @override
  _updateUserState createState() => _updateUserState();
}

class _updateUserState extends State<updateUser> {
  Future<void> updatePost({
    required int id,
    required String title,
    required String body,
    required int userId,
  }) async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/posts/$id');

    final response = await http.put(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'id' : id,
        'title': title,
        'body': body,
        'userId': userId,
      }),
    );

    if (response.statusCode == 200) {
      print("Update Success");
      print(response.body);
    } else {
      throw Exception('Failed to update post');
    }
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: (){
              updatePost(
                  id:  1,
                  title: "Hello Developer",
                  body: "Are you Developer",
                  userId: 10
              );
            },
         child: Text("Update", style: TextStyle(color: Colors.orange),),
      ),
      )
    );
    
  }
}
