import 'package:flutter/material.dart';
import 'package:get_api_posts/screens/comments_screens.dart';
import 'package:get_api_posts/screens/home_screen.dart';
import 'package:get_api_posts/screens/photos_screens.dart';
import 'package:get_api_posts/screens/posts_screens.dart';
import 'package:get_api_posts/screens/todos_screens.dart';
import 'package:get_api_posts/screens/users_screens.dart';
import 'screens/loginscreen.dart';
import 'screens/updatescreen.dart';


void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        "/" : (context) => HomeScreen(),
        "/photos" : (context) => PhotoScreen(),
        "/comments" : (context) => CommentsScreen(),
        "/posts" : (context) => PostsScreens(),
        "/todos" : (context) => TodosScreen(),
        "/users" : (context) => UsersScreen(),
        "/login" : (context) => LoginScreen(),
        "/update" : (context) => updateUser(),
      },
    );
  }
}