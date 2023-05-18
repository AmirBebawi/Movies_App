import 'package:flutter/material.dart';

class Releases_Container extends StatelessWidget {
  String imagePath;

  Releases_Container({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    var mediaquery = MediaQuery.of(context).size;
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(9),
          child: Container(
            margin: EdgeInsets.all(8),
            child: Image.network(
              'https://image.tmdb.org/t/p/w500/$imagePath',
              height: mediaquery.height * 0.2,
            ),
          ),
        ),
        Image.asset(
          'assets/images/bookmark.png',
          height: 27,
        )
      ],
    );
  }
}
