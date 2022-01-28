import 'package:flutter/material.dart';

class ImageLocal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      child: Image.asset(
        'images/a.jpeg',
        fit: BoxFit.cover,
      ),
      height: 100,
      width: 100,
    ));
  }
}

class ImageNetwork extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Image.network(
            "https://www.itying.com/themes/itying/images/ionic4.png"),
        height: 300,
        width: 300,
        decoration: BoxDecoration(color: Colors.deepPurple.shade300),
      ),
    );
  }
}

class ImageCircle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 300,
        height: 300,
        decoration: BoxDecoration(
          color: Colors.deepOrangeAccent.shade100,
          borderRadius: BorderRadius.circular(150),
          image: DecorationImage(
            image: NetworkImage(
                "https://www.itying.com/images/201906/goods_img/1120_P_1560842352183.png"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class ImageClipOval extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: ClipOval(
          child: Image.network(
            'https://www.itying.com/themes/itying/images/ionic4.png',
            fit: BoxFit.cover,
            height: 100,
            width: 100,
          ),
        ),
      ),
    );
  }
}
