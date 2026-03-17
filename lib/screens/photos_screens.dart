import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get_api_posts/models/photos.dart';
import 'package:http/http.dart' as http;

class PhotoScreen extends StatefulWidget {
  const PhotoScreen({super.key});

  @override
  State<PhotoScreen> createState() => _PhotoScreenState();
}

class _PhotoScreenState extends State<PhotoScreen> {
  late Future<List<Photos>> _photosFuture;

  @override
  void initState() {
    super.initState();
    _photosFuture = getPhotos();
  }

  Future<List<Photos>> getPhotos() async {
    try {
      final response = await http.get(
        Uri.parse("https://jsonplaceholder.typicode.com/photos"),
      );
      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        return data.map((item) => Photos.fromJson(item)).toList();
      } else {
        throw Exception("Failed to load photos: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error fetching data: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text("Get Photos")),
      body: FutureBuilder<List<Photos>>(
        future: _photosFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Error: ${snapshot.error}"),
            );
          } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            return ListView.builder(
              itemCount: snapshot.data!.length > 100 ? 100 : snapshot.data!.length, // Limiting to 100 for better performance
              itemBuilder: (context, index) {
                final photo = snapshot.data![index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(photo.url),
                    radius: 25,
                  ),
                  title: Text(
                    photo.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: Text("ID: ${photo.id}"),
                );
              },
            );
          } else {
            return const Center(
              child: Text("No Data Found"),
            );
          }
        },
      ),
    );
  }
}
