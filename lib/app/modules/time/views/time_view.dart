import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:muslim_app/app/modules/time/views/calender.dart';
import 'package:muslim_app/app/modules/time/views/header.dart';
import 'package:muslim_app/theme.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../controllers/time_controller.dart';

class TimeView extends GetView<TimeController> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Get.put(TimeController());
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        body: Stack(
          children: [
            Column(
              children: [
                HeaderWidget(),
                CalenderWidget(),
              ],
            ),
            SlidingUpPanel(
              defaultPanelState: PanelState.CLOSED,
              maxHeight: size.height - 310,
              minHeight: 180,
              boxShadow: [],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
              color: greyColor,
              panelBuilder: (c) {
                return ListView(
                    controller: c,
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.fromLTRB(20, 30, 20, 80),
                    children: [
                      _time(context,
                          icon: 'assets/icons/time/imsak_active.svg',
                          title: 'imsak',
                          time: '03:45',
                          isCurrentTime: true),
                      _time(context,
                          icon: 'assets/icons/time/subuh.svg',
                          title: 'subuh',
                          time: '04:00'),
                      _time(context,
                          icon: 'assets/icons/time/dzuhur.svg',
                          title: 'dzuhur',
                          time: '12:00'),
                      _time(context,
                          icon: 'assets/icons/time/ashar.svg',
                          title: 'ashar',
                          time: '13:00'),
                      _time(context,
                          icon: 'assets/icons/time/magrib.svg',
                          title: 'magrib',
                          time: '18:00'),
                      _time(context,
                          icon: 'assets/icons/time/isya.svg',
                          title: 'isya',
                          time: '17:45')
                    ]);
              },
            ),
          ],
        ),
      ),
    );
  }

  Container _time(BuildContext context,
      {bool isCurrentTime = false,
      required String icon,
      required String title,
      required String time}) {
    return Container(
      height: 60,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            blurRadius: 30,
            offset: Offset(0, 4),
            color: isCurrentTime
                ? cyanColor.withOpacity(0.25)
                : whiteColor.withOpacity(0.08),
          )
        ],
        color: isCurrentTime ? cyanColor : whiteColor,
      ),
      child: Row(
        children: [
          SvgPicture.asset(icon),
          SizedBox(width: 10),
          Text(title,
              style: mediumTextStyle.copyWith(
                  fontSize: 16,
                  color: isCurrentTime ? whiteColor : blackColor)),
          Spacer(),
          Text(time,
              style: regularTextStyle.copyWith(
                  fontSize: 12, color: isCurrentTime ? whiteColor : blackColor))
        ],
      ),
    );
  }
}
