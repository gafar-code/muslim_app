import 'package:arabic_numbers/arabic_numbers.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:muslim_app/app/models/ayat.dart';
import 'package:muslim_app/app/models/surah.dart';
import 'package:muslim_app/app/modules/quran/controllers/quran_controller.dart';
import 'package:muslim_app/theme.dart';

import 'frame.dart';
import 'header.dart';

class PaperView extends GetView<QuranController> {
  final Surah surah;
  PaperView(this.surah);
  @override
  Widget build(BuildContext context) {
    Get.find<QuranController>();
    ArabicNumbers arabicNumbers = ArabicNumbers();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Column(
      children: [
        HeaderWidget(surah),
        Stack(children: [
          FrameWidget(),
          Align(
            alignment: Alignment.center,
            child: Container(
                padding: EdgeInsets.symmetric(vertical: 8),
                height: size.height - 200,
                width: size.width,
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 30),
                  children: [
                    FutureBuilder<Ayat>(
                        future: controller.getAyat(surah.nomor),
                        builder: ((context, snapshot) {
                          if (snapshot.hasData) {
                            Ayat data = snapshot.data!;
                            List<TextSpan> listOfTextSpan = [];

                            for (int i = 0; i < data.ayat.length; i++) {
                              listOfTextSpan.add(TextSpan(
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = (() {
                                      Get.defaultDialog(
                                          backgroundColor:
                                              cyanColor.withOpacity(0.4),
                                          titleStyle: boldTextStyle.copyWith(
                                              color: whiteColor),
                                          titlePadding: EdgeInsets.symmetric(
                                              vertical: 30),
                                          title:
                                              "${surah.namaLatin} : {${data.ayat[i].nomor}}",
                                          content: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              _button(
                                                  'Simpan',
                                                  Icons.bookmark_add,
                                                  blueColor),
                                              _button('Favorite',
                                                  Icons.favorite, redColor),
                                              _button('Detail', Icons.info,
                                                  greenColor),
                                            ],
                                          ));
                                    }),
                                  text:
                                      " ${data.ayat[i].ar} \uFD3F${arabicNumbers.convert(data.ayat[i].nomor)}\uFD3E "));
                            }
                            return Directionality(
                                textDirection: TextDirection.rtl,
                                child: RichText(
                                    textAlign: TextAlign.justify,
                                    text: TextSpan(
                                        style: lightTextStyle.copyWith(
                                            fontFamily: 'MeQuran',
                                            fontSize: 24,
                                            color: blackColor),
                                        children: listOfTextSpan)));
                          }
                          return Center(child: CircularProgressIndicator());
                        })),
                  ],
                )),
          )
        ]),
      ],
    ));
  }

  Column _button(String title, IconData icon, Color color) {
    return Column(
      children: [
        CircleAvatar(
            backgroundColor: color, child: Icon(icon, color: whiteColor)),
        Text(title,
            style: lightTextStyle.copyWith(fontSize: 12, color: whiteColor))
      ],
    );
  }
}
