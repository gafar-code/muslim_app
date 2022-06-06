import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:muslim_app/app/modules/home/controllers/home_controller.dart';
import 'package:muslim_app/models/post.dart';
import 'package:muslim_app/theme.dart';

class ContentWidget extends GetView<HomeController> {
  final ScrollController c;
  ContentWidget(this.c);
  @override
  Widget build(BuildContext context) {
    Get.find<HomeController>();
    return Expanded(
      child: FutureBuilder<List<Post>>(
          future: controller.getPosts(),
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              List<Post> data = snapshot.data!;
              return ListView.builder(
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.only(top: 20, bottom: 60),
                  controller: c,
                  itemCount: data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return _landscapePost(data[index], context);
                  });
            }
            return Center(child: CircularProgressIndicator());
          })),
    );
  }

  Container _potraitPost(Size size) {
    return Container(
      height: 144,
      width: size.width,
      margin: EdgeInsets.symmetric(horizontal: defaultPadding),
      decoration: BoxDecoration(
          color: whiteColor, borderRadius: BorderRadius.circular(8)),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 12),
            height: 120,
            width: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                  image: AssetImage('assets/images/content_tumb.jpg'),
                  fit: BoxFit.cover),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: 48,
                width: 175,
                child: Text(
                  'Tinggal di masjid Kampu, Anak pengurus pondok pesantren',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: boldTextStyle.copyWith(fontSize: 16),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Oleh', style: lightTextStyle.copyWith(fontSize: 9)),
                  SizedBox(width: 4),
                  Text('Ustad Rifki',
                      style: mediumTextStyle.copyWith(fontSize: 9)),
                  SizedBox(width: 4),
                  Text('* 4 jam lalu',
                      style: mediumTextStyle.copyWith(
                          fontSize: 9, color: grey2Color)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircleAvatar(
                    radius: 11,
                    backgroundImage: AssetImage('assets/images/ustad1.png'),
                  ),
                  SizedBox(width: 20),
                  Container(
                    height: 24,
                    width: 64,
                    padding: EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                        color: greyColor,
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SvgPicture.asset('assets/icons/vote_up.svg'),
                        Text('25', style: lightTextStyle.copyWith(fontSize: 9)),
                        SvgPicture.asset('assets/icons/vote_down.svg'),
                      ],
                    ),
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  Container _landscapePost(Post post, BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 240,
      width: size.width,
      margin: EdgeInsets.fromLTRB(24, 0, 24, 24),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Container(
            height: 148,
            width: size.width,
            margin: EdgeInsets.fromLTRB(10, 10, 10, 6),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: cyanColor,
                image: DecorationImage(
                    image: NetworkImage(post.thumbnail), fit: BoxFit.fill)),
          ),
          Container(
            height: 60,
            width: size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: 260,
                        child: Text(post.title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: boldTextStyle.copyWith(fontSize: 12)),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 11,
                            backgroundImage: NetworkImage(post.thumbnail),
                          ),
                          SizedBox(width: 5),
                          Text('Oleh',
                              style: lightTextStyle.copyWith(fontSize: 9)),
                          SizedBox(width: 4),
                          Text('Gafar Riskyanto',
                              style: mediumTextStyle.copyWith(fontSize: 9))
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                          "${post.pubDate.day} ${post.pubDate.month} ${post.pubDate.year}",
                          style: mediumTextStyle.copyWith(
                              fontSize: 9, color: yellowColor)),
                      SvgPicture.asset('assets/icons/bookmark.svg')
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
