import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/todos.dart';

class TodosScreen extends StatefulWidget {
  @override
  _TodosScreenState createState() => _TodosScreenState();
}

class _TodosScreenState extends State<TodosScreen> {
  List<Todos> todosList = [];

  Future<List<Todos>> getTodos() async {
    final response = await http.get(
      Uri.parse("https://jsonplaceholder.typicode.com/todos"),
    );
    if (response.statusCode == 200) {
      var getData = jsonDecode(response.body) as List;
      final todosList = getData.map((e) => Todos.fromJSON(e)).toList();
      return todosList;
    } else {
      throw Exception("Failed to Get");
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text(
              "Get TodoData",
          ),
      ),
      body: FutureBuilder <List<Todos>>(
        future: getTodos(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: CircularProgressIndicator()
            );
          }
          if (snapshot.hasData) {
            final todos = snapshot.data!;
            return ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                final todo = todos[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                      child: ListTile(
                         title: Text(todo.title),
                        subtitle: Text(
                            todo.completed ? "Completed" : "Pending",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: todo.completed? Colors.green : Colors.redAccent,
                          ),
                        ),
                      )
                  ),
                );
              },
            );
          } else {
            return Center(
                child: Text(
                    "No Data Found",
                ),
            );
          }
        },
      ),
    );
  }
}
