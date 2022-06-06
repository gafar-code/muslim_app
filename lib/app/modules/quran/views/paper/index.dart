import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:muslim_app/app/modules/quran/controllers/quran_controller.dart';
import 'package:muslim_app/theme.dart';

class IndexWidget extends GetView<QuranController> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: whiteColor,
                boxShadow: [
                  BoxShadow(
                      blurRadius: 4,
                      offset: Offset(0, 4),
                      color: Colors.black.withOpacity(0.08))
                ]),
            child: Icon(CupertinoIcons.left_chevron, size: 18),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              '1',
              style: mediumTextStyle.copyWith(fontSize: 18),
            ),
          ),
          Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: whiteColor,
                boxShadow: [
                  BoxShadow(
                      blurRadius: 4,
                      offset: Offset(0, 4),
                      color: Colors.black.withOpacity(0.08))
                ]),
            child: Icon(CupertinoIcons.right_chevron, size: 18),
          ),
        ],
      ),
    );
  }
}
