import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../models/movie.dart';

class MovieRepository {
  final String moviesUrl =
      'http://raw.githubusercontent.com/FEND16/movie-json-data/master/json/movies-coming-soon.json';
  Future<List<Movie>> fetchAllMovies(http.Client client) async {
    try {
      final response = await client.get(Uri.parse(moviesUrl));
      List<Movie> movies;
      (response.statusCode == 200)
          ? movies = await compute(parseMovies, response.body)
          : throw Exception('Failed to load movies');
      return movies;
    } catch (error) {
      Error.throwWithStackTrace(error, StackTrace.current);
    }
  }

  List<Movie> parseMovies(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<Movie>((json) => Movie.fromJson(json)).toList();
  }
}
