import 'package:json_annotation/json_annotation.dart';

part 'movie.g.dart';

@JsonSerializable()
class Movie {
  String? id;
  String? title;
  String? year;
  List<String>? genres;
  List<int>? ratings;
  String? poster;
  String? contentRating;
  String? duration;
  String? releaseDate;
  int? averageRating;
  String? originalTitle;
  String? storyline;
  List<String>? actors;
  double? imdbRating;
  String? posterurl;

  Movie({
    this.id,
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

  @override
  String toString() {
    return 'Movie(id: $id, title: $title, year: $year, genres: $genres, ratings: $ratings, poster: $poster, contentRating: $contentRating, duration: $duration, releaseDate: $releaseDate, averageRating: $averageRating, originalTitle: $originalTitle, storyline: $storyline, actors: $actors, imdbRating: $imdbRating, posterurl: $posterurl)';
  }

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  Map<String, dynamic> toJson() => _$MovieToJson(this);

  Movie copyWith({
    String? id,
    String? title,
    String? year,
    List<String>? genres,
    List<int>? ratings,
    String? poster,
    String? contentRating,
    String? duration,
    String? releaseDate,
    int? averageRating,
    String? originalTitle,
    String? storyline,
    List<String>? actors,
    double? imdbRating,
    String? posterurl,
  }) {
    return Movie(
      id: id ?? this.id,
      title: title ?? this.title,
      year: year ?? this.year,
      genres: genres ?? this.genres,
      ratings: ratings ?? this.ratings,
      poster: poster ?? this.poster,
      contentRating: contentRating ?? this.contentRating,
      duration: duration ?? this.duration,
      releaseDate: releaseDate ?? this.releaseDate,
      averageRating: averageRating ?? this.averageRating,
      originalTitle: originalTitle ?? this.originalTitle,
      storyline: storyline ?? this.storyline,
      actors: actors ?? this.actors,
      imdbRating: imdbRating ?? this.imdbRating,
      posterurl: posterurl ?? this.posterurl,
    );
  }

  @override
  int get hashCode =>
      id.hashCode ^
      title.hashCode ^
      year.hashCode ^
      genres.hashCode ^
      ratings.hashCode ^
      poster.hashCode ^
      contentRating.hashCode ^
      duration.hashCode ^
      releaseDate.hashCode ^
      averageRating.hashCode ^
      originalTitle.hashCode ^
      storyline.hashCode ^
      actors.hashCode ^
      imdbRating.hashCode ^
      posterurl.hashCode;
}
