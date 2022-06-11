import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:muslim_app/app/modules/quran/controllers/quran_controller.dart';
import 'package:muslim_app/theme.dart';

class FrameWidget extends GetView<QuranController> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: SizedBox(
        height: size.height - 160, // di ubah
        width: size.width,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset('assets/images/frame_topleft.png',
                      height: 60, width: 52),
                  Image.asset('assets/images/frame_topright.png',
                      height: 60, width: 52),
                ],
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 3),
                    height: 2,
                    width: size.width - 104,
                    color: cyanColor,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 2),
                    height: 1,
                    width: size.width - 98,
                    decoration: BoxDecoration(color: cyanColor, boxShadow: [
                      BoxShadow(
                        blurRadius: 5,
                        offset: Offset(0, 4),
                        color: cyanColor.withOpacity(0.5),
                      )
                    ]),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('assets/images/frame_bottomleft.png',
                      height: 60, width: 52),
                  Image.asset('assets/images/frame_bottomright.png',
                      height: 60, width: 52),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 2),
                    height: 1,
                    width: size.width - 98,
                    decoration: BoxDecoration(color: cyanColor, boxShadow: [
                      BoxShadow(
                        blurRadius: 5,
                        offset: Offset(0, -4),
                        color: cyanColor,
                      )
                    ]),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 3),
                    height: 2,
                    width: size.width - 104,
                    color: cyanColor,
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(4, 60, 1, 60),
                    width: 2,
                    color: cyanColor,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 50),
                    width: 1,
                    color: cyanColor,
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 50),
                    width: 1,
                    color: cyanColor,
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(1, 60, 4, 60),
                    width: 2,
                    color: cyanColor,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
