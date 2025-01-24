import 'dart:async';

import 'package:app_filmes/data/models/movie.dart';
import 'package:app_filmes/data/models/movie_api.dart';
import 'package:app_filmes/services/service_locator.dart';
import 'package:logger/logger.dart';

class MovieListController {
  final api = getIt<MovieApi>();
  final Logger logger = Logger();

  final _controller = StreamController<List<Movie>>();
  Stream<List<Movie>> get stream => _controller.stream;

  void init() {
    getMovies();
  }

  Future<void> getMovies() async {
    try {
      logger.d('Fetching movies...');
      var result = await api.getMovies();
      logger.d('Movies fetched: ${result.length}');
      _controller.sink.add(result);
    } catch (error) {
      logger.e('Error fetching movies: $error');
      _controller.sink.addError(error);
    }
  }

  Future<void> searchMovies(Map<String, String?> filters) async {
    try {
      logger.d('Searching movies with filters: $filters');
      var result = await api.getMovies(); // Ajustar para usar filtros na API
      if (filters['name'] != null && filters['name']!.isNotEmpty) {
        result = result
            .where((movie) => movie.name
                .toLowerCase()
                .contains(filters['name']!.toLowerCase()))
            .toList();
      }
      if (filters['year'] != null && filters['year']!.isNotEmpty) {
        result = result
            .where((movie) => movie.year.toString() == filters['year'])
            .toList();
      }
      if (filters['category'] != null && filters['category']!.isNotEmpty) {
        result = result
            .where((movie) => movie.gender == filters['category'])
            .toList();
      }
      logger.d('Movies found: ${result.length}');
      _controller.sink.add(result);
    } catch (error) {
      logger.e('Error searching movies: $error');
      _controller.sink.addError(error);
    }
  }
}
