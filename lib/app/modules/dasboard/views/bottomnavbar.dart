import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:muslim_app/app/modules/dasboard/controllers/dasboard_controller.dart';
import 'package:muslim_app/theme.dart';

class BottomNavbar extends GetView<DasboardController> {
  @override
  Widget build(BuildContext context) {
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SvgPicture.asset('assets/icons/navbar/home_active.svg'),
                    SvgPicture.asset('assets/icons/navbar/compas.svg'),
                    SizedBox(width: 20),
                    SvgPicture.asset('assets/icons/navbar/quran.svg'),
                    SvgPicture.asset('assets/icons/navbar/person.svg'),
                  ],
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
