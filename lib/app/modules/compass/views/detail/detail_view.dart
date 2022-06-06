import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:muslim_app/app/modules/compass/controllers/compass_controller.dart';
import 'package:muslim_app/theme.dart';

class DetailView extends GetView<CompassController> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: greyColor,
        body: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: size.height * 0.5,
                width: size.width,
                margin: EdgeInsets.only(top: 50),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/map_tumb.jpg'),
                        fit: BoxFit.fill)),
              ),
            ),
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30)),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 30,
                            offset: Offset(0, 4),
                            color: blackColor.withOpacity(0.1))
                      ]),
                  padding: EdgeInsets.fromLTRB(20, 40, 20, 20),
                  height: 140,
                  width: size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      IconButton(
                          onPressed: Get.back,
                          icon: Icon(CupertinoIcons.arrow_left)),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text('Kiblat',
                            style: regularTextStyle.copyWith(fontSize: 18)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: SvgPicture.asset('assets/icons/more_map.svg'),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Column(
                  children: [
                    Container(
                      height: size.height - 400,
                      width: size.width,
                      decoration: BoxDecoration(
                        color: whiteColor.withOpacity(0.5),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Center(
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              height: 60,
                              width: size.width,
                              margin: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 30),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: whiteColor,
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 30,
                                        offset: Offset(0, 4),
                                        color: cyanColor.withOpacity(0.25))
                                  ]),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SvgPicture.asset(
                                      'assets/icons/navbar/compas.svg'),
                                  SizedBox(width: 10),
                                  Text('12.16116, 72.16165',
                                      style: mediumTextStyle.copyWith(
                                          fontSize: 14)),
                                  Spacer(),
                                  Text('09:13',
                                      style: mediumTextStyle.copyWith(
                                          fontSize: 14)),
                                ],
                              ),
                            ),
                          ),
                          Spacer(),
                          Container(
                            height: 180,
                            width: 180,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: RadialGradient(
                                    colors: [purpleColor, cyanColor])),
                          ),
                          Spacer(),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
