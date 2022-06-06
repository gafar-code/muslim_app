import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:muslim_app/app/modules/quran/controllers/quran_controller.dart';
import 'package:muslim_app/theme.dart';

import 'header.dart';

class DetailView extends GetView<QuranController> {
  @override
  Widget build(BuildContext context) {
    // Get.find<QuranController>();
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: greyColor,
        body: Column(
          children: [
            HeaderWidget(),
            Expanded(
                child: ListView(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.zero,
              children: [
                _ayat(context,
                    arab:
                        'بَرَآءَةٌ مِّنَ ٱللَّهِ وَرَسُولِهِۦٓ إِلَى ٱلَّذِينَ عَٰهَدتُّم مِّنَ ٱلْمُشْرِكِينَ',
                    latin:
                        "1. Barā`atum minallāhi wa rasụlihī ilallażīna 'āhattum minal-musyrikīn",
                    arti:
                        "(Inilah pernyataan) pemutusan hubungan dari Allah dan Rasul-Nya kepada orang-orang musyrikin yang kamu telah mengadakan perjanjian."),
                _ayat(context,
                    arab:
                        "فَسِيحُوا۟ فِى ٱلْأَرْضِ أَرْبَعَةَ أَشْهُرٍ وَٱعْلَمُوٓا۟ أَنَّكُمْ غَيْرُ مُعْجِزِى ٱللَّهِ ۙ وَأَنَّ ٱللَّهَ مُخْزِى ٱلْكَٰفِرِينَ",
                    latin:
                        "2. Fa sīḥụ fil-arḍi arba'ata asy-huriw wa'lamū annakum gairu mu'jizillāhi wa annallāha mukhzil-kāfirīn",
                    arti:
                        "Maka berjalanlah kamu di muka bumi selama empat bulan dan ketahuilah bahwa sesungguhnya kamu tidak akan dapat melemahkan Allah, dan sesungguhnya Allah menghinakan orang-orang kafir.")
              ],
            )),
            Container(
              height: 180,
              width: size.width,
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
              ),
              child: Column(
                children: [
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Spacer(),
                      SvgPicture.asset('assets/icons/play_left.svg'),
                      SizedBox(width: 20),
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: redColor,
                        child: SvgPicture.asset('assets/icons/play.svg'),
                      ),
                      SizedBox(width: 20),
                      SvgPicture.asset('assets/icons/play_right.svg'),
                      Spacer(),
                    ],
                  ),
                  SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('03:15',
                          style: lightTextStyle.copyWith(fontSize: 14)),
                      Text('20:15',
                          style: lightTextStyle.copyWith(fontSize: 14)),
                    ],
                  )
                ],
              ),
            )
          ],
        ));
  }

  Column _ayat(BuildContext context,
      {required String arab, required String latin, required String arti}) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(18),
          decoration: BoxDecoration(
              border: Border.all(color: cyanColor, width: 1.5),
              color: cyanColor.withOpacity(0.12),
              borderRadius: BorderRadius.circular(18)),
          child: Text(
            arab,
            textAlign: TextAlign.right,
            style: lightTextStyle.copyWith(fontSize: 18),
          ),
        ),
        SizedBox(height: 14),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(latin, style: mediumTextStyle.copyWith(fontSize: 14)),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(arti, style: lightTextStyle.copyWith(fontSize: 14)),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
