import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../models/movie.dart';

/// Displays detailed information about a selected movie.
@RoutePage<dynamic>()
class MovieDetailsPage extends StatelessWidget {
  final Movie movie;

  const MovieDetailsPage({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title!),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              movie.posterurl!,
              fit: BoxFit.cover,
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 2,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Description:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(movie.storyline!),
                  SizedBox(height: 16),
                  Text(
                    'Genres:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(movie.genres!.join(', ')),
                  SizedBox(height: 16),
                  Text(
                    'Actors:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(movie.actors!.join(', ')),
                  SizedBox(height: 16),
                  Text(
                    'Ratings:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(movie.ratings.toString()),
                  SizedBox(height: 16),
                  Text(
                    'Released Date:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(movie.releaseDate!),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
