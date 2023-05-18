import 'package:flutter/material.dart';
import 'package:movies/Recommended/recommended_container.dart';
import 'package:movies/network/remote/api_manager.dart';

import '../models/recommended_responce.dart';
import '../mytheme/theme.dart';

class Recommended_api extends StatelessWidget {
  const Recommended_api({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourceRecommended>(
      future: ApiManager.getRecommended(),
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
              ElevatedButton(onPressed: () {}, child: const Text('Try again'))
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
        return Container(
          margin: const EdgeInsets.only(left: 15),
          padding: const EdgeInsets.all(10),
          color: MyTheme.gray,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Recomemded',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(fontSize: 17),
              ),
              const SizedBox(height: 4),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Recommended_Container(
                        title: resultList[index].title ?? '',
                        release: resultList[index].releaseDate ?? '',
                        imagePath: resultList[index].posterPath ?? '',
                        vote: resultList[index].voteAverage ?? 0);
                  },
                  itemCount: resultList.length,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
