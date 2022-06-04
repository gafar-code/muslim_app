import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/compas_controller.dart';

class CompasView extends GetView<CompasController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CompasView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'CompasView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
