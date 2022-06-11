import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:muslim_app/app/models/surah.dart';
import 'package:muslim_app/app/modules/quran/controllers/quran_controller.dart';
import 'package:muslim_app/theme.dart';

import 'detail/detail_view.dart';

class IndexWidget extends GetView<QuranController> {
  @override
  Widget build(BuildContext context) {
    Get.find<QuranController>();
    return FutureBuilder<List<Surah>>(
        future: controller.getIndexSurah(),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            List<Surah> data = snapshot.data!;
            return ListView.builder(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.fromLTRB(20, 340, 20, 80),
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  return _indexSurah(context, data[index]);
                });
          }
          return Center(child: CircularProgressIndicator());
        }));
  }

  Widget _indexSurah(BuildContext context, Surah surah) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => Get.to(DetailView(), arguments: surah),
        child: Column(
          children: [
            Container(
              height: 44,
              width: MediaQuery.of(context).size.width,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                      backgroundColor: blackColor,
                      child: Center(
                          child: Text(
                        "${surah.nomor}",
                        style: regularTextStyle.copyWith(fontSize: 9),
                      )),
                      radius: 12),
                  SizedBox(width: 14),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(surah.namaLatin,
                          style: mediumTextStyle.copyWith(
                              color: blackColor, fontSize: 16)),
                      Text(
                        surah.arti,
                        style: regularTextStyle.copyWith(fontSize: 9),
                      ),
                    ],
                  ),
                  Spacer(),
                  SizedBox(
                    width: 100,
                    child: Text(
                      surah.nama,
                      textAlign: TextAlign.right,
                      maxLines: 2,
                      style: mediumTextStyle.copyWith(
                          fontSize: 14, color: blackColor),
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
      ),
    );
  }
}
