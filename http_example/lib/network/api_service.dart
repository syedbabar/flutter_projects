import 'dart:convert';

import 'package:http_example/model/posts.dart';
import 'package:http_example/model/photos.dart';
import 'package:http/http.dart' as http;

Future<List<Post>> getPosts() async {
  final response = await http.get("https://jsonplaceholder.typicode.com/posts");

  List responseJson = json.decode(response.body);
  return responseJson.map((m) => new Post.fromJson(m)).toList();
}

Future<List<Photos>> getPhotos() async {
  final response =
      await http.get("https://jsonplaceholder.typicode.com/photos");

  List responseJson = json.decode(response.body);
  return responseJson.map((m) => new Photos.fromJson(m)).toList();
}
