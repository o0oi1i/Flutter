import 'package:flutter/material.dart';

import 'package:mine/model/course.dart';
import '../components/course/course_card.dart';
import '../components/navbar/navbar.dart';

class Card1 extends StatelessWidget {
  const Card1({Key key}) : super(key: key);
  // 1
  final String category = 'Editor\'s Choice';
  final String title = 'The Art of Dough';
  final String description = 'Learn to make the perfect bread.';
  final String chef = 'Ray Wenderlich';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Column(
          children: [
            NavBar(),
            Center(
              child: Container(
                width: 1000,
                height: 350,
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
