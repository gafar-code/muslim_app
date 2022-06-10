import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:muslim_app/app/modules/time/controllers/time_controller.dart';
import 'package:muslim_app/theme.dart';

class CalenderWidget extends GetView<TimeController> {
  @override
  Widget build(BuildContext context) {
    int currentYear = DateTime.now().year;
    int currentMonth = DateTime.now().month;
    int daysInMonth = DateUtils.getDaysInMonth(currentYear, currentMonth);
    Get.find<TimeController>();

    return Column(
      children: [
        SizedBox(height: 20),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset('assets/icons/calender_left.svg'),
              Text(
                'April 2022',
                style: semiBoldTextStyle.copyWith(fontSize: 18),
              ),
              SvgPicture.asset('assets/icons/calender_right.svg'),
            ],
          ),
        ),
        SizedBox(height: 40),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _calender(number: 13, day: 'Senin'),
              _calender(number: 14, day: 'Selasa'),
              _calender(number: 15, day: 'Rabu'),
              _calender(number: 16, day: 'Kamis'),
              _calender(number: 17, day: 'Jumat'),
              _calender(number: 18, day: 'Sabtu'),
              _calender(number: 19, day: 'Minggu', isCurrentTime: true),
            ],
          ),
        ),
        SizedBox(height: 20),
        Container(
            height: 400,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(30),
            ),
            child: GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: 20),
              itemCount: daysInMonth,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 7),
              itemBuilder: (context, index) {
                return _calenderDetail(
                    index + 1,
                    controller.daysName(
                        DateTime(currentYear, currentMonth, index - 1)
                            .weekday));
              },
            ))
      ],
    );
  }

  Center _calenderDetail(int date, String name) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: whiteColor,
            border: Border.all(color: whiteColor)),
        height: 38,
        width: 38,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(name, style: regularTextStyle.copyWith(fontSize: 9)),
            Text('$date', style: mediumTextStyle.copyWith(fontSize: 12)),
          ],
        ),
      ),
    );
  }

  Center _calender(
      {bool isCurrentTime = false, required int number, required String day}) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: isCurrentTime ? cyanColor.withOpacity(0.12) : whiteColor,
            border: Border.all(color: isCurrentTime ? cyanColor : whiteColor)),
        height: 68,
        width: 32,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(day[0] + day[1],
                style: isCurrentTime
                    ? boldTextStyle.copyWith(fontSize: 12, color: cyanColor)
                    : regularTextStyle.copyWith(fontSize: 12)),
            Text('$number',
                style: isCurrentTime
                    ? boldTextStyle.copyWith(fontSize: 12, color: cyanColor)
                    : regularTextStyle.copyWith(fontSize: 12)),
          ],
        ),
      ),
    );
  }
}
