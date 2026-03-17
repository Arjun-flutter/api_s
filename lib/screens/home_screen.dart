import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color(0xFF2C3E50),
      appBar: AppBar(
        backgroundColor: Color(0xFF2C3E50),
        centerTitle: true,
        title: Text(
          "API DashBoard",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w800,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: ListView(
          children: [
            ListTile(
              leading: Icon(Icons.camera_alt_outlined, color: Colors.blue),
              title: Text(
                "Photos",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 25,
                  color: Colors.blue,
                ),
              ),
              onTap: () => Navigator.pushNamed(context, "/photos"),
            ),
            ListTile(
              leading: Icon(Icons.comment, color: Colors.amber),
              title: Text(
                "Comments",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 25,
                  color: Colors.amber,
                ),
              ),
              onTap: () => Navigator.pushNamed(context, "/comments"),
            ),
            ListTile(
              leading: Icon(Icons.edit, color: Colors.purple),
              title: Text(
                "Posts",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 25,
                  color: Colors.purple,
                ),
              ),
              onTap: () => Navigator.pushNamed(context, "/posts"),
            ),
            ListTile(
              leading: Icon(Icons.check_box_outlined, color: Colors.orange),
              title: Text(
                "Todos",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 25,
                  color: Colors.orange,
                ),
              ),
              onTap: () => Navigator.pushNamed(context, "/todos"),
            ),
            ListTile(
              leading: Icon(Icons.person, color: Colors.teal),
              title: Text(
                "Users",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 25,
                  color: Colors.teal,
                ),
              ),
              onTap: () => Navigator.pushNamed(context, "/users"),
            ),
            ListTile(
              leading: Icon(Icons.key, color: Colors.green),
              title: Text(
                "Login",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 25,
                  color: Colors.green,
                ),
              ),
              onTap: () => Navigator.pushNamed(context, "/login"),
            ),
            ListTile(
              leading: Icon(Icons.update, color: Colors.red),
              title: Text(
                "UpDate",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 25,
                  color: Colors.red,
                ),
              ),
              onTap: () => Navigator.pushNamed(context, "/update"),
            ),
          ],
        ),
      ),
    );
  }
}
