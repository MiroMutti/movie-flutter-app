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
          color: Colors
              .transparent, // Set the card background color to transparent
          elevation: 0, // Remove card shadow
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.network(
                  movie.posterurl!,
                  height: MediaQuery.of(context).size.height * 0.32,
                  fit: BoxFit.cover,
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
                      fit: BoxFit.cover,
                      height: MediaQuery.of(context).size.height * 0.32,
                      width: double.infinity,
                    );
                  },
                ),
              ),
              const Gap(4),
              Text(
                movie.title!,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              const Gap(8),
              if (movie.ratings != null || movie.ratings!.isNotEmpty)
                const Row(
                  children: [
                    Icon(Icons.star, color: Colors.yellow),
                    Icon(Icons.star, color: Colors.yellow),
                    Icon(Icons.star, color: Colors.yellow),
                    Icon(Icons.star_border, color: Colors.yellow),
                    Icon(Icons.star_border, color: Colors.yellow),
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
