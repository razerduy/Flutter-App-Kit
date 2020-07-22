import 'dart:async';
import 'dart:convert';

import 'package:cards/storage/datasource/post_repo/post_remote/post_remote.dart';
import 'package:cards/storage/object/post.dart';
import 'package:cards/utils/webservice.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class PostRemoteImplement implements PostRemote {
  WebService _webService = Get.find();
  
  @override
  Future<List<Post>> getPostOnNetwork() async {
     Response response = await _webService.get('/posts');
     if (response != null) {
       if (response.statusCode >= 200 && response.statusCode < 300) {
         try {
           List postMap = jsonDecode(response.body);
           List<Post> posts = postMap.map((e) => Post.fromJson(e)).toList();
           return posts;
         } catch (err) {
           throw err;
         }
       }
       throw response.statusCode;
     }
     throw TimeoutException('time out');
  }

}