// class Movie {
//   final String id;
//   final String? title;
//   final String? year;
//   final List<String>? genres;
//   final List<int>? ratings;
//   final String? poster;
//   final String? contentRating;
//   final String? duration;
//   final String? releaseDate;
//   final int? averageRating;
//   final String? originalTitle;
//   final String? storyline;
//   final List<String>? actors;
//   final String? imdbRating;
//   final String? posterurl;

//   const Movie({
//     required this.id,
//     this.title,
//     this.year,
//     this.genres,
//     this.ratings,
//     this.poster,
//     this.contentRating,
//     this.duration,
//     this.releaseDate,
//     this.averageRating,
//     this.originalTitle,
//     this.storyline,
//     this.actors,
//     this.imdbRating,
//     this.posterurl,
//   });

//   factory Movie.fromJson(Map<String, dynamic> json) {
//     return Movie(
//         id: json['id'] as String,
//         title: json['title'] as String,
//         year: json['year'] as String,
//         genres: json['genres'] as List<String>,
//         ratings: json['ratings'] as List<int>,
//         poster: json['poster'] as String,
//         contentRating: json['contentRating'] as String,
//         duration: json['duration'] as String,
//         releaseDate: json['releaseDate'] as String,
//         averageRating: json['averageRating'] as int,
//         originalTitle: json['originalTitle'] as String,
//         storyline: json['storyLine'] as String,
//         actors: json['actors'] as List<String>,
//         imdbRating: json['imdbRating'] as String,
//         posterurl: json['posterurl'] as String);
//   }
// }
