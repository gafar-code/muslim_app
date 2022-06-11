import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:muslim_app/app/models/calender.dart';
import 'package:muslim_app/app/modules/time/controllers/time_controller.dart';
import 'package:muslim_app/theme.dart';

class CalenderWidget extends GetView<TimeController> {
  @override
  Widget build(BuildContext context) {
    int dateNow = DateTime.now().day;
    int currentYear = DateTime.now().year;
    int currentMonth = DateTime.now().month;
    Get.find<TimeController>();

    return Container(
        height: 500,
        width: MediaQuery.of(context).size.width,
        child: FutureBuilder<CalenderModel>(
            future:
                controller.getCalender(year: currentYear, month: currentMonth),
            builder: ((context, snapshot) {
              CalenderModel? data = snapshot.data;
              if (snapshot.hasData) {
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
                            "${controller.monthName[data!.month - 1]} ${data.year}",
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
                          children: List.generate(7, (index) {
                            int number =
                                controller.weeksDay(data, dateNow)[index];
                            String day = data.monthly.daily[number].text.w;

                            return _calender(
                                number: number,
                                day: day,
                                isCurrentTime: number == dateNow);
                          })),
                    ),
                    SizedBox(height: 20),
                    Expanded(
                      child: GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        itemCount: data.monthly.daily.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 7),
                        itemBuilder: (context, index) {
                          String name = data.monthly.daily[index].text.w;
                          String date = data.monthly.daily[index].day.m;
                          bool isHolyday =
                              data.monthly.daily[index].text.w == 'Ahad';
                          return _calenderDetail(
                              name: name, date: date, isHolyday: isHolyday);
                        },
                      ),
                    ),
                  ],
                );
              }
              return CircularProgressIndicator();
            })));
  }

  Center _calenderDetail(
      {required String date, required String name, required bool isHolyday}) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3),
            color: whiteColor,
            border: Border.all(color: greyColor)),
        height: 60,
        width: 60,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(name,
                style: regularTextStyle.copyWith(
                    fontSize: 9, color: isHolyday ? redColor : blackColor)),
            Text(date,
                style: mediumTextStyle.copyWith(
                    fontSize: 12, color: isHolyday ? redColor : blackColor)),
          ],
        ),
      ),
    );
  }

  Center _calender(
      {required bool isCurrentTime, required int number, required String day}) {
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
