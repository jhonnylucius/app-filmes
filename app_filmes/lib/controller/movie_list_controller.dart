import 'dart:async';

import 'package:app_filmes/data/models/movie.dart';
import 'package:app_filmes/data/models/movie_api.dart';
import 'package:app_filmes/services/service_locator.dart';
import 'package:logger/logger.dart';

class MovieListController {
  final api = getIt<MovieApi>();

  final _controller = StreamController<List<Movie>>();
  Stream<List<Movie>> get stream => _controller.stream;

  void init() {
    getMovies();
  }

  Future<void> getMovies() async {
    try {
      var result = await api.getMovies();
      _controller.sink.add(result);
    } catch (error) {
      Logger().e('Erro ao buscar filmes: $error');
      _controller.sink.addError(error);
    }
  }
}
