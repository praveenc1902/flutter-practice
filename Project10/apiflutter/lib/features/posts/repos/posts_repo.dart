import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:apiflutter/features/posts/models/post_data_ui_model.dart';
import 'package:http/http.dart' as http;

class PostsRepo{
  static Future<List<PostsDataUIModel>> fetchPosts() async{
    var client = http.Client();
    try {
      var response = await client.get(
          Uri.parse('https://jsonplaceholder.typicode.com/posts/'));
      List result = jsonDecode(response.body);
      // print(response.body);
      List<PostsDataUIModel> posts = [];
      for (int i = 0; i < result.length; i++) {
        PostsDataUIModel post = PostsDataUIModel.fromJson(
            result[i] as Map<String, dynamic>);
        posts.add(post);
      }
      // print(posts);
      return posts;
    }catch(e){
      log(e.toString());
      return [];
    }
  }

  static Future<bool> addPosts() async {
    var client = http.Client();
    try {
      var response = await client.post(
          Uri.parse('https://jsonplaceholder.typicode.com/posts/'),
      body: {
            'title' : 'My Name is Praveen',
        'body' : 'I am learning Flutter tutors',
        'userId' : '123'
      });
      if (response.statusCode >=200 && response.statusCode<300){
          return true;
      }
      else {
        return false;
      }
    }catch(e){
      log(e.toString());
      return false;
    }
  }
}