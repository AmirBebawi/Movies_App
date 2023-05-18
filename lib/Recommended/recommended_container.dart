import 'package:flutter/material.dart';

import '../mytheme/theme.dart';

class Recommended_Container extends StatelessWidget {
  String title;
  String imagePath;
  String release;
  num vote;

  Recommended_Container(
      {required this.title,
      required this.release,
      required this.imagePath,
      required this.vote});

  @override
  Widget build(BuildContext context) {
    var mediaquery = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: Container(
        margin: const EdgeInsets.all(8),
        color: MyTheme.Fontgray,
        width: mediaquery.width * 0.24,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  margin: const EdgeInsets.all(8),
                  child: Image.network(
                    'https://image.tmdb.org/t/p/w500/$imagePath',
                  ),
                ),
                Image.asset(
                  'assets/images/bookmark.png',
                  height: 27,
                )
              ],
            ),
            const SizedBox(height: 2),
            Container(
              padding: const EdgeInsets.only(left: 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: MyTheme.yellow,
                        size: 16,
                      ),
                      const SizedBox(width: 3),
                      Text(
                        '$vote',
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(fontSize: 8),
                      )
                    ],
                  ),
                  const SizedBox(height: 5),
                  Text(
                    title,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(fontSize: 13),
                  ),
                  const SizedBox(height: 7),
                  Text(
                    release,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(fontSize: 10, color: Colors.white),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
