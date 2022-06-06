import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:muslim_app/app/modules/quran/controllers/quran_controller.dart';
import 'package:muslim_app/theme.dart';

import 'detail/detail_view.dart';

class IndexWidget extends GetView<QuranController> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.fromLTRB(20, 380, 20, 80),
      children: [
        _indexSurah(context),
        _indexSurah(context),
        _indexSurah(context),
        _indexSurah(context),
        _indexSurah(context),
        _indexSurah(context),
        _indexSurah(context),
      ],
    );
  }

  Widget _indexSurah(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(DetailView()),
      child: Column(
        children: [
          Container(
            height: 44,
            width: MediaQuery.of(context).size.width,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                    backgroundColor: grey2Color,
                    child: Center(
                        child: Text(
                      '1',
                      style: regularTextStyle.copyWith(fontSize: 9),
                    )),
                    radius: 12),
                SizedBox(width: 14),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Al-Fatihah',
                        style: mediumTextStyle.copyWith(
                            color: grey2Color, fontSize: 16)),
                    Text(
                      'Pembukaan',
                      style: regularTextStyle.copyWith(fontSize: 9),
                    ),
                  ],
                ),
                Spacer(),
                SizedBox(
                  width: 100,
                  child: Text(
                    'بِسْمِ اللّٰهِ الرَّحْمٰنِ الرَّحِيْمِ',
                    textAlign: TextAlign.right,
                    maxLines: 2,
                    style: mediumTextStyle.copyWith(
                        fontSize: 14, color: grey2Color),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 0.5,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(vertical: 16),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8), color: grey2Color),
          )
        ],
      ),
    );
  }
}
