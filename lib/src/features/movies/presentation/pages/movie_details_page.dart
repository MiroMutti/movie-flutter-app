import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:movie_app/src/features/movies/service/helpers.dart';
import 'package:movie_app/src/utils/styles.dart';

import '../../models/movie.dart';
import '../movie_app_bar.dart';

/// Displays detailed information about a selected movie.
@RoutePage<dynamic>()
class MovieDetailsPage extends StatelessWidget {
  const MovieDetailsPage({Key? key, required this.movie}) : super(key: key);
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    String movieDuration = getDuration(movie.duration!);
    return Scaffold(
        body: CustomScrollView(
      slivers: <Widget>[
        MovieSliverAppBar(
          movie: movie,
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                children: [
                  Text(
                    movie.title!,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Gap(8),
                  Text(
                    '(${movie.year})',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),
              const Gap(8),
              if (movie.duration != '')
                DefaultTextStyle(
                  style: Theme.of(context).textTheme.bodyMedium!,
                  // .copyWith(color: const Color.fromARGB(255, 5, 5, 1)),
                  child: Row(
                    children: [
                      Icon(
                        CupertinoIcons.clock_fill,
                        size: 16,
                        color: AppColor.primary,
                      ),
                      const SizedBox(width: 8.0),
                      Text(maxLines: 2, '$movieDuration minutes')
                    ],
                  ),
                ),
              const Gap(16),
              const Divider(color: AppColor.kOutlineColor, height: 1.0),
              const Gap(16.0),
              Text(
                'Ratings:',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Gap(8),
              if (movie.averageRating! != 0.0)
                Row(
                  children: [
                    Text('Average:'),
                    Text(movie.averageRating!.toStringAsFixed(1)),
                    Icon(Icons.star, color: Colors.yellow),
                  ],
                ),
              if (movie.imdbRating != 0.0)
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('IMDB:'),
                    Gap(8),
                    Text(movie.imdbRating!.toStringAsFixed(1)),
                    Icon(Icons.star, color: Colors.yellow),
                  ],
                ),
              const Gap(16.0),
              const Divider(color: AppColor.kOutlineColor, height: 1.0),
              const Gap(16.0),
              Text(
                'Story line',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 8.0),
              Text(
                movie.storyline!,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: AppColor.kSecondaryTextColor),
              ),
              Gap(16),
              const Divider(color: AppColor.kOutlineColor, height: 1.0),
              const Gap(16.0),
              Text(
                'Genres',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 8),
              Text(movie.genres!.join(', ')),
              const Gap(16.0),
              const Divider(color: AppColor.kOutlineColor, height: 1.0),
              const Gap(16.0),
              Text(
                'Actors:',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 8),
              Text(movie.actors!.join(', ')),
              const SizedBox(height: 16),
            ]),
          ),
        ),
      ],
    ));
  }
}
