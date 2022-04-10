import 'package:flutter/material.dart';

import 'package:mine/model/course.dart';
import '../components/course/course_card.dart';
import '../components/navbar/navbar.dart';
import '../components/swiper/swiper_ad.dart';
import '../components/label/title_lab.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);
  // 1
  final String category = 'Editor\'s Choice';
  final String title = 'The Art of Dough';
  final String description = 'Learn to make the perfect bread.';
  final String chef = 'Ray Wenderlich';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: ListView(
          children: [
            NavBar(),
            SwiperAd(),
            TitleLab(value: "热门推荐"),
            Center(
              child: Container(
                width: 1000,
                height: 300,
                child: Center(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(16.0),
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: /*1*/ (context, i) {
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
