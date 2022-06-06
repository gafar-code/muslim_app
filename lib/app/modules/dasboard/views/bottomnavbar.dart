import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:muslim_app/app/modules/dasboard/controllers/dasboard_controller.dart';
import 'package:muslim_app/theme.dart';

class BottomNavbar extends GetView<DasboardController> {
  @override
  Widget build(BuildContext context) {
    List<String> listOfIcons = <String>[
      'assets/icons/navbar/home.svg',
      'assets/icons/navbar/compas.svg',
      'assets/icons/navbar/quran.svg',
      'assets/icons/navbar/person.svg',
    ];
    List<String> listOfActiveIcons = <String>[
      'assets/icons/navbar/home_active.svg',
      'assets/icons/navbar/compas_active.svg',
      'assets/icons/navbar/quran_active.svg',
      'assets/icons/navbar/person_active.svg',
    ];
    List<Widget> icons(int index) {
      List<Widget> result = [];
      for (int i = 0; i < listOfIcons.length; i++) {
        result.add(GestureDetector(
          onTap: () => controller.changePage(i),
          child: index == i
              ? Container(
                  height: 68,
                  width: 68,
                  padding: EdgeInsets.all(20),
                  child: SvgPicture.asset(listOfActiveIcons[i]))
              : Container(
                  height: 68,
                  width: 68,
                  padding: EdgeInsets.all(20),
                  child: SvgPicture.asset(listOfIcons[i])),
        ));
      }
      result.insert(2, SizedBox(width: 30));
      return result;
    }

    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 88,
        width: MediaQuery.of(context).size.width,
        color: whiteColor,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: 20,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: greyColor,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20))),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: 68,
                width: MediaQuery.of(context).size.width,
                child: Obx(
                  () => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: icons(controller.currentIndex.value)),
                ),
              ),
            ),
            Align(
              alignment: Alignment(0, -1.5),
              child: Container(
                padding: EdgeInsets.all(3),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: whiteColor,
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 8,
                          offset: Offset(0, 4),
                          color: redColor.withOpacity(0.5))
                    ]),
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: redColor,
                  child: SvgPicture.asset('assets/icons/add.svg'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
