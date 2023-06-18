import 'package:flutter/material.dart';

import '../models/movie.dart';
import 'movie_item.dart';

/// Displays a list of Movies.
class MoviesList extends StatelessWidget {
  const MoviesList({super.key, required this.movies});

  final List<Movie> movies;

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          // mainAxisSpacing: 8.0,
          //crossAxisSpacing: 8.0,
          childAspectRatio: 0.5,
        ),
        itemCount: movies.length,
        itemBuilder: (BuildContext context, int index) {
          return MovieListItem(
            movie: movies[index],
          );
        });
  }
}
