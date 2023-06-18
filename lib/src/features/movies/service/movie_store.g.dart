// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MovieStore on _MovieStore, Store {
  late final _$loadingAtom =
      Atom(name: '_MovieStore.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$loadedAtom = Atom(name: '_MovieStore.loaded', context: context);

  @override
  bool get loaded {
    _$loadedAtom.reportRead();
    return super.loaded;
  }

  @override
  set loaded(bool value) {
    _$loadedAtom.reportWrite(value, super.loaded, () {
      super.loaded = value;
    });
  }

  late final _$errorAtom = Atom(name: '_MovieStore.error', context: context);

  @override
  String? get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(String? value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  late final _$allMoviesAtom =
      Atom(name: '_MovieStore.allMovies', context: context);

  @override
  ObservableList<Movie> get allMovies {
    _$allMoviesAtom.reportRead();
    return super.allMovies;
  }

  @override
  set allMovies(ObservableList<Movie> value) {
    _$allMoviesAtom.reportWrite(value, super.allMovies, () {
      super.allMovies = value;
    });
  }

  late final _$getAllMoviesAsyncAction =
      AsyncAction('_MovieStore.getAllMovies', context: context);

  @override
  Future<void> getAllMovies() {
    return _$getAllMoviesAsyncAction.run(() => super.getAllMovies());
  }

  late final _$_MovieStoreActionController =
      ActionController(name: '_MovieStore', context: context);

  @override
  void reset() {
    final _$actionInfo =
        _$_MovieStoreActionController.startAction(name: '_MovieStore.reset');
    try {
      return super.reset();
    } finally {
      _$_MovieStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
loaded: ${loaded},
error: ${error},
allMovies: ${allMovies}
    ''';
  }
}
