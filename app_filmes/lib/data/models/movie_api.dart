import 'package:app_filmes/data/models/movie.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class MovieApi {
  final Dio _dio = Dio(
    BaseOptions(baseUrl: 'https://apifilmes.webevolui.com'),
  );
  final Logger logger = Logger();

  Future<List<Movie>> getMovies({int skip = 0, int take = 20}) async {
    try {
      logger.d('Requesting movies from API...');
      var response = await _dio.get('/filme?skip=$skip&take=$take');
      logger.d('Response received: ${response.data}');
      return (response.data as List)
          .map((item) => Movie.fromJson(item))
          .toList();
    } catch (e) {
      logger.e('Error in API request: $e');
      rethrow;
    }
  }
}
