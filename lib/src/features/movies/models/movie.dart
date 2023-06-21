import 'dart:core';

class Movie {
  final String id;
  final String? title;
  final String? year;
  final List<String>? genres;
  final List<int?>? ratings;
  final String? poster;
  final String? contentRating;
  final String? duration;
  final String? releaseDate;
  final double? averageRating;
  final String? originalTitle;
  final String? storyline;
  final List<String>? actors;
  final double? imdbRating;
  final String? posterurl;

  const Movie({
    required this.id,
    this.title,
    this.year,
    this.genres,
    this.ratings,
    this.poster,
    this.contentRating,
    this.duration,
    this.releaseDate,
    this.averageRating,
    this.originalTitle,
    this.storyline,
    this.actors,
    this.imdbRating,
    this.posterurl,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    final List<int> ratingsList = List<int>.from(json['ratings']);
    final double averageRating = ratingsList.isNotEmpty
        ? ratingsList.reduce((a, b) => a + b) / ratingsList.length
        : 0.0;

    return Movie(
      id: json['id'] as String,
      title: json['title'] as String?,
      year: json['year'] as String?,
      genres:
          (json['genres'] as List<dynamic>).map((e) => e as String).toList(),
      ratings: (json['ratings'] as List<dynamic>)
          .map((e) => e is String ? int.tryParse(e) ?? 0 : e as int)
          .toList(),
      poster: json['poster'] as String?,
      contentRating: json['contentRating'] as String?,
      duration: json['duration'] as String?,
      releaseDate: json['releaseDate'] as String?,
      averageRating: averageRating,
      originalTitle: json['originalTitle'] as String?,
      storyline: json['storyline'] as String?,
      actors:
          (json['actors'] as List<dynamic>?)?.map((e) => e as String).toList(),
      imdbRating: json['imdbRating'] is String
          ? double.tryParse(json['imdbRating']) ?? 0.0
          : json['imdbRating'] as double,
      posterurl: json['posterurl'] as String?,
    );
  }
}
