import 'package:flutter/material.dart';

import '../../model/course.dart';

import '../../themes/ec_theme.dart';

// ignore: must_be_immutable
class CourseCard extends StatelessWidget {
  CourseCard({this.course});

  Course course;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 20.0, left: 10, right: 10),
          child: Container(
            width: 210,
            height: 230,
            decoration: BoxDecoration(
              gradient: course.background,
              borderRadius: BorderRadius.circular(17.0),
              boxShadow: [
                BoxShadow(
                  color: course.background.colors[0].withOpacity(0.1),
                  offset: Offset(2, 4),
                  blurRadius: 4.0,
                ),
                BoxShadow(
                  color: course.background.colors[1].withOpacity(0.3),
                  offset: Offset(3, 6),
                  blurRadius: 6.0,
                )
              ],
            ),
            child: Column(
              children: [
                Padding(
                    padding: EdgeInsets.only(
                      top: 20.0,
                      left: 20.0,
                    ),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              course.courseSubtitle,
                              style: ECTheme.darkTextTheme.bodyText2,
                            ),
                            Text(
                              course.courseTitle,
                              style: ECTheme.darkTextTheme.headline2,
                            ),
                          ],
                        ),
                        Expanded(
                          child: SizedBox(
                            width: 10,
                          ),
                        ),
                      ],
                    )),
                Expanded(
                  child: Image.asset(
                    'asset/illustrations/${course.illustration}',
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 25.0),
          child: Container(
            child: Image.asset('asset/logos/${course.logo}'),
            width: 48.0,
            height: 48.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: course.background.colors[1].withOpacity(1),
                  offset: Offset(0, 3),
                  blurRadius: 5.0,
                )
              ],
            ),
            padding: EdgeInsets.all(10.0),
          ),
        ),
      ],
    );
  }
}
