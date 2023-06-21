import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:movie_app/src/routing/app_router.gr.dart';

import '../models/movie.dart';

class MovieListItem extends StatelessWidget {
  const MovieListItem({super.key, required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
          color: const Color.fromARGB(
              4, 0, 0, 0), // Set the card background color to transparent
          elevation: 0, // Remove card shadow
          child: Container(
            padding: const EdgeInsets.only(left: 8.0, top: 12, right: 8.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: Image.network(
                      movie.posterurl!,
                      height: MediaQuery.of(context).size.height * 0.30,
                      fit: BoxFit.fill,
                      loadingBuilder: (BuildContext context, Widget child,
                          ImageChunkEvent? loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                    loadingProgress.expectedTotalBytes!
                                : null,
                          ),
                        );
                      },
                      errorBuilder: (context, exception, stackTrace) {
                        return Image.asset(
                          'assets/images/poster_placeholder.png',
                          fit: BoxFit.fill,
                          height: MediaQuery.of(context).size.height * 0.30,
                          width: double.infinity,
                        );
                      },
                    ),
                  ),
                  const Gap(6),
                  Text(
                    movie.title!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                  const Gap(2),
                  if (movie.ratings != null || movie.ratings!.isNotEmpty)
                    Row(
                      children: [
                        Text(movie.averageRating!.toStringAsFixed(1)),
                        Icon(Icons.star, color: Colors.yellow),
                      ],
                    ),
                ]),

            // Navigator.restorablePushNamed(
            // context,
            // MovieDetailsView.routeName,
            // );
            //},
          )),
      onTap: () => context.router.push(MovieDetailsRoute(movie: movie)),
    );
  }
}
