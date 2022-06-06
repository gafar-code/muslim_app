import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:muslim_app/API/api.dart';
import 'package:muslim_app/models/post.dart';

class HomeController extends GetxController {
  RxBool panelOpen = false.obs;
  RxInt tabMenuIndex = 0.obs;
  ScrollController scrollController = ScrollController();
  panelState(bool value) {
    panelOpen.value = value;
  }

  tabIndexChange(value) {
    tabMenuIndex.value = value;
  }

  controllerSet(value) {
    scrollController = value;
  }

  Future<List<Post>> getPosts() async {
    var result = await http.get(Uri.parse(urlNews));
    if (result.statusCode == 200) {
      Map<String, dynamic> news = json.decode(result.body);
      List posts = news['data']['posts'];
      List<Post> listOfPost = posts.map((e) => Post.fromJson(e)).toList();
      return listOfPost;
    } else {
      return <Post>[];
    }
  }
}
