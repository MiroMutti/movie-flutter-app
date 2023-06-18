import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../models/movie.dart';

class MovieRepository {
  final String moviesUrl =
      'http://raw.githubusercontent.com/FEND16/movie-json-data/master/json/movies-coming-soon.json';
  Future<List<Movie>> fetchAllMovies(http.Client client) async {
    final response = await client.get(Uri.parse(moviesUrl));

    return compute(parseMovies, response.body);

    // if (response.statusCode == 200) {
    //   List<Movie> movies = (json.decode(response.body) as List)
    //       .map((data) => Movie.fromJson(data))
    //       .toList();
    //   return movies;
    // } else {
    //   throw Exception('Failed to load movies');
    // }
  }

  List<Movie> parseMovies(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<Movie>((json) => Movie.fromJson(json)).toList();
  }
}
