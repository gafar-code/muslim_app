import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:muslim_app/app/modules/quran/controllers/quran_controller.dart';
import 'package:muslim_app/theme.dart';

class HeaderWidget extends GetView<QuranController> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          height: 246,
          width: size.width,
          padding: EdgeInsets.fromLTRB(20, 60, 20, 20),
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(24),
              bottomRight: Radius.circular(24),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Al-Quran',
                      style: mediumTextStyle.copyWith(fontSize: 18)),
                  Spacer(),
                  SvgPicture.asset(
                    'assets/icons/notification.svg',
                    color: blackColor,
                  ),
                  SizedBox(width: 18),
                  CircleAvatar(
                    radius: 28,
                    backgroundImage: AssetImage('assets/images/profile.png'),
                  )
                ],
              ),
              Container(
                  margin: EdgeInsets.only(top: 30),
                  height: 68,
                  width: size.width,
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/patern2.png'),
                          fit: BoxFit.fill),
                      color: purpleColor,
                      borderRadius: BorderRadius.circular(60)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset('assets/icons/read.svg'),
                      SizedBox(width: 18),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Terakhir dibaca',
                              style: lightTextStyle.copyWith(
                                  fontSize: 10, color: whiteColor)),
                          SizedBox(height: 8),
                          Text('Al-Haqqah',
                              style: mediumTextStyle.copyWith(
                                  fontSize: 12, color: whiteColor)),
                        ],
                      ),
                      Spacer(),
                      SizedBox(
                        width: 80,
                        child: Text('اَلْحَاۤقَّةُۙ',
                            textAlign: TextAlign.right,
                            maxLines: 1,
                            style: mediumTextStyle.copyWith(
                                fontSize: 18, color: whiteColor)),
                      ),
                    ],
                  )),
            ],
          ),
        ),
        Container(
          height: 54,
          margin: EdgeInsets.fromLTRB(20, 40, 20, 0),
          padding: EdgeInsets.symmetric(horizontal: 10),
          width: size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: whiteColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _tabItem(title: 'Surah', isActive: true),
              _tabItem(title: 'Juzz'),
              _tabItem(title: 'Doa'),
            ],
          ),
        )
      ],
    );
  }

  Container _tabItem({required String title, bool isActive = false}) {
    return Container(
        height: 36,
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: isActive ? cyanColor : whiteColor,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
                color: isActive ? cyanColor.withOpacity(0.25) : whiteColor,
                blurRadius: 4,
                offset: Offset(0, 4))
          ],
        ),
        child: Center(
            child: Text(
          title,
          style: regularTextStyle.copyWith(
              fontSize: 12, color: isActive ? whiteColor : blackColor),
        )));
  }
}
