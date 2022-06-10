import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:muslim_app/app/modules/home/controllers/home_controller.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DetailView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    String url = Get.arguments;
    return Scaffold(
        body: Column(
      children: [
        Expanded(
            child: WebView(
                javascriptMode: JavascriptMode.unrestricted, initialUrl: url))
      ],
    ));
  }
}
