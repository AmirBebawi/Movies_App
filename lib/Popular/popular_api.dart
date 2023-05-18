import 'package:flutter/material.dart';
import 'package:movies/Popular/popular_movies.dart';
import 'package:movies/network/remote/api_manager.dart';

import '../models/popluar_movie_responce.dart';
import '../mytheme/theme.dart';

class Popular_Container extends StatelessWidget {
  const Popular_Container({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourcePopuler>(
      future: ApiManager.getSources(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
              child: CircularProgressIndicator(
            color: MyTheme.orange,
          ));
        } else if (snapshot.hasError) {
          return Column(
            children: [
              const Text('Something went wrong'),
              ElevatedButton(onPressed: () {}, child: const Text('Trey again'))
            ],
          );
        }
        if (snapshot.data?.page != 1) {
// server has code and message
          return Column(
            children: [
              Text(snapshot.data?.StatusMessage ?? ''),
              ElevatedButton(onPressed: () {}, child: const Text('Try again'))
            ],
          );
        }
//data
        var resultList = snapshot.data?.results ?? [];
        return ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Popular_Movie(
              results: resultList[index],
            );
          },
          itemCount: resultList.length,
        );
      },
    );
  }
}
