import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../model/course.dart';

import '../components/navbar/navbar.dart';
import '../components/swiper/swiper_ad.dart';
import '../components/label/title_lab.dart';
import '../components/course/course_card.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      child: SafeArea(
        child: ListView(
          children: [
            NavBar(),
            SwiperAd(),
            TitleLab(value: "热门推荐"),
            Center(
              child: Container(
                height: ScreenUtil().setHeight(440),
                child: Center(
                  child: ListView.builder(
                    padding: EdgeInsets.fromLTRB(
                      ScreenUtil().setWidth(16),
                      ScreenUtil().setHeight(5),
                      ScreenUtil().setWidth(16),
                      ScreenUtil().setWidth(0),
                    ),
                    scrollDirection: Axis.horizontal,
                    itemCount: recentCourses.length,
                    itemBuilder: (context, i) {
                      return CourseCard(
                        course: recentCourses[i],
                      );
                    },
                  ),
                ),
              ),
            ),
            TitleLab(value: "猜您喜欢"),
            Center(
              child: Container(
                height: ScreenUtil().setHeight(500),
                child: Center(
                  child: GridView.builder(
                    shrinkWrap: true,
                    itemCount: recentCourses.length,
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      childAspectRatio: 1,
                    ),
                    itemBuilder: (context, i) {
                      return CourseCard(
                        course: recentCourses[i],
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
