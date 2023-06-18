import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:movie_app/src/features/movies/repo/movie_repository.dart';
import 'package:http/http.dart' as http;

import '../models/movie.dart';

part 'movie_store.g.dart';

class MovieStore extends _MovieStore with _$MovieStore {
  MovieStore(MovieRepository repo) : super(repo);
}

abstract class _MovieStore with Store {
  _MovieStore(this.repo);
  final MovieRepository repo;

  @observable
  bool loading = false;
  @observable
  bool loaded = false;
  @observable
  String? error;

  @observable
  ObservableList<Movie> allMovies = ObservableList();

  @action
  Future<void> getAllMovies() async {
    error = null;
    loading = true;
    loaded = false;
    try {
      final List<Movie> list = await repo.fetchAllMovies(http.Client());
      allMovies = ObservableList<Movie>.of(list);
      loading = false;
      loaded = true;
      error = '';
      //allMovies.isNotEmpty ? list : throw ();
    } catch (e) {
      debugPrint('e get $e');
      error = e.toString();
      loading = false;
      loaded = false;
    }
  }

  @action
  void reset() {
    error = null;
    loading = false;
    loaded = false;
  }
}
