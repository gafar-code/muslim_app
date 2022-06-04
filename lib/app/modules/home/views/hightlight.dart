import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:muslim_app/app/modules/home/controllers/home_controller.dart';
import 'package:muslim_app/theme.dart';

class HightLightWidget extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20),
      height: 100,
      width: size.width,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.zero,
        physics: BouncingScrollPhysics(),
        children: [
          _content(
              title: 'Pilar Iman',
              image: 'assets/images/ustad1.png',
              stats: 'Live'),
          _content(
              title: 'Kultum Islami',
              image: 'assets/images/ustad2.png',
              stats: 'Live'),
          _content(
              title: 'Indahnya Mualaf',
              image: 'assets/images/ustad3.png',
              stats: 'Preview'),
          _content(
              title: 'Aqiqah',
              image: 'assets/images/ustad4.png',
              stats: 'Replay'),
        ],
      ),
    );
  }

  Center _content(
      {required String title, required String image, required String stats}) {
    Color _color() {
      late Color result;
      switch (stats) {
        case 'Live':
          result = redColor;
          break;
        case 'Preview':
          result = blueColor;
          break;
        case 'Replay':
          result = yellowColor;
          break;
        default:
          result = blackColor;
          break;
      }
      return result;
    }

    return Center(
      child: Container(
          margin: EdgeInsets.only(right: 50),
          width: 52,
          height: 70,
          child: Column(children: [
            Container(
                height: 52,
                width: 52,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: stats == 'Live' ? greenColor : whiteColor,
                ),
                child: Stack(
                  children: [
                    Center(
                      child: CircleAvatar(
                        radius: 24,
                        child: Image.asset(image),
                      ),
                    ),
                    Align(
                      alignment: Alignment(0, 1.1),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 4),
                        decoration: BoxDecoration(
                          color: _color(),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          stats,
                          style: boldTextStyle.copyWith(
                              color: whiteColor, fontSize: 9),
                        ),
                      ),
                    )
                  ],
                )),
            Spacer(),
            Text(title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: mediumTextStyle.copyWith(
                  fontSize: 9,
                  color: whiteColor,
                )),
          ])),
    );
  }
}
