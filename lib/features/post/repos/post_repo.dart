import 'dart:convert';

import 'package:SampleBlocProject/features/post/models/post_data_model.dart';
import 'package:http/http.dart' as http;

class PostRepo {
  static Future<List<PostDataModel>> fetchPost() async {
    var client = http.Client();
    try {
      var response = await client
          .get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));

      List decodedResponse = json.decode(response.body);
      List<PostDataModel> posts =
          decodedResponse.map((post) => PostDataModel.fromMap(post)).toList();

      return posts;
    } catch (e) {
      print("something went wrong $e");
      return [];
    }
  }
}
