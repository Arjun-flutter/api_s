import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/user/users.dart';



class UsersScreen extends StatefulWidget {
  @override
  _UsersScreenState createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {

List<Users> listUsers = [];

  Future<List<Users>> getUsers() async {
    String Url = "https://jsonplaceholder.typicode.com/users";
    final response = await http.get(
        Uri.parse(Url)
    );

    if (response.statusCode == 200) {
      var usersData = jsonDecode(response.body) as List;
      var usersList = usersData.map((e) => Users.fromJSON(e)).toList();
      return usersList;
    } else {
      throw Exception("Failed to Fetch");
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          centerTitle:true,
            title: Text(
                "Get Users"
            ),
        ),
      body: FutureBuilder (
          future: getUsers(),
          builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                  child: CircularProgressIndicator()
              );
            }
            if(snapshot.hasError) {
              return Text(
                  "error: ${snapshot.error}",
              );
            }
            if(snapshot.hasData) {
              final user = snapshot.data!;
              return ListView.builder(
                itemCount: user.length,
                  itemBuilder: (context, index) {
                  final User = user[index];
                  return Card(
                    child:  Padding(
                      padding:  EdgeInsets.all(10.0),
                      child: Padding(
                        padding:  EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ReusableRow(title: "Id", value: snapshot.data![index].id.toString()),
                            ReusableRow(title: "Name", value: snapshot.data![index].name.toString()),
                            ReusableRow(title: "UserName", value: snapshot.data![index].username.toString()),
                            ReusableRow(title: "Email", value: snapshot.data![index].email.toString()),
                            ReusableRow(title: "Phone", value: snapshot.data![index].phone.toString()),
                            ReusableRow(title: "Website", value: snapshot.data![index].website.toString()),
                            ReusableRow(title: "Street", value: snapshot.data![index].address.street.toString()),
                            ReusableRow(title: "Suite", value: snapshot.data![index].address.suite.toString()),
                            ReusableRow(title: "City", value: snapshot.data![index].address.city.toString()),
                            ReusableRow(title: "Zipcode", value: snapshot.data![index].address.zipcode.toString()),
                            ReusableRow(title: "Company", value: snapshot.data![index].name.toString()),
                            ReusableRow(title: "catchPhrase", value: snapshot.data![index].company.catchPhrase.toString()),
                            ReusableRow(title: "bs", value: snapshot.data![index].company.bs.toString())

                          ],
                        ),
                      ),
                    ),
                  );
                  }
              );
            }
            else {
              return Text("No Data Found");
            }
         }
      ),
    );
  }
}

class ReusableRow extends StatelessWidget {
   String title, value;
  ReusableRow({required this.title, required this.value});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: TextStyle(fontWeight: FontWeight.w700),),
        Text(value),
      ],
    );
  }
}
