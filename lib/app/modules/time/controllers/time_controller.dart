import 'dart:convert';

import 'package:get/get.dart';
import 'package:muslim_app/api/api.dart';
import 'package:muslim_app/app/models/calender.dart';
import 'package:http/http.dart' as http;

class TimeController extends GetxController {
  int dateNow = DateTime.now().day;
  int currentYear = DateTime.now().year;
  RxInt currentMonth = DateTime.now().month.obs;
  RxInt pageIndex = 0.obs;

  int pageChange(int value) {
    int n = value;
    if (value > pageIndex.value) {
      n = value - pageIndex.value;
      currentMonth++;
    } else {
      n = pageIndex.value - value;
      currentMonth--;
    }
    return n;
  }

  List<String> monthName = [
    'Januari',
    'Februari',
    'Maret',
    'April',
    'Mei',
    'Juni',
    'Juli',
    'Agustus',
    'September',
    'Oktober',
    'November',
    'Desember'
  ];

  List<int> firstWeek = [];
  List<int> scondWeek = [];
  List<int> thirdWeek = [];
  List<int> fourtWeek = [];
  List<int> fiveWeek = [];
  List<int> sixWeek = [];

  void weeksGenerate(CalenderModel calender, int dateNow) {
    int i = 0;
    if (i < 7) {
      for (int i = 0; i < calender.monthly.daily.length; i++) {
        int n = int.tryParse(calender.monthly.daily[i].day.m)!;
        firstWeek.add(n);
      }
    } else if (i > 7 && i < 14) {
      for (int i = 0; i < calender.monthly.daily.length; i++) {
        int n = int.tryParse(calender.monthly.daily[i].day.m)!;
        scondWeek.add(n);
      }
    } else if (i > 14 && i < 21) {
      for (int i = 0; i < calender.monthly.daily.length; i++) {
        int n = int.tryParse(calender.monthly.daily[i].day.m)!;
        thirdWeek.add(n);
      }
    } else if (i > 21 && i < 28) {
      for (int i = 0; i < calender.monthly.daily.length; i++) {
        int n = int.tryParse(calender.monthly.daily[i].day.m)!;
        fourtWeek.add(n);
      }
    } else if (i > 28 && i < 35) {
      for (int i = 0; i < calender.monthly.daily.length; i++) {
        int n = int.tryParse(calender.monthly.daily[i].day.m)!;
        fiveWeek.add(n);
      }
    } else if (i > 35 && i < 42) {
      for (int i = 0; i < calender.monthly.daily.length; i++) {
        int n = int.tryParse(calender.monthly.daily[i].day.m)!;

        sixWeek.add(n);
      }
    }
    if (i == calender.monthly.daily.length) return;
  }

  int weeksCount(CalenderModel calender, int dateNow) {
    weeksGenerate(calender, dateNow);
    bool isFirst = firstWeek.contains(dateNow);
    bool isScond = scondWeek.contains(dateNow);
    bool isThird = thirdWeek.contains(dateNow);
    bool isFour = fourtWeek.contains(dateNow);
    bool isFive = fiveWeek.contains(dateNow);
    bool isSix = sixWeek.contains(dateNow);
    if (isFirst) return 1;
    if (isScond) return 2;
    if (isThird) return 3;
    if (isFour) return 4;
    if (isFive) return 5;
    if (isSix) return 6;
    return 0;
  }

  List<int> weeksDay(CalenderModel calender, int dateNow) {
    List<int> listDayOntheWeek = [];
    int count = weeksCount(calender, dateNow);
    int previewsDay = count * 7;
    int dayOntheWeeks = previewsDay + 7;
    for (int i = previewsDay; i < dayOntheWeeks;) {
      listDayOntheWeek.add(i);
      i++;
    }
    return listDayOntheWeek;
  }

  Future<CalenderModel> getCalender(
      {required int year, required int month}) async {
    String url = "$urlKalender/$year/$month";
    var result = await http.get(Uri.parse(url));
    if (result.statusCode == 200) {
      Map<String, dynamic> jsonBody = json.decode(result.body);
      Map<String, dynamic> data = jsonBody['data'];
      CalenderModel calenderData = CalenderModel.fromJson(data);
      return calenderData;
    } else {
      throw Exception;
    }
  }
}
