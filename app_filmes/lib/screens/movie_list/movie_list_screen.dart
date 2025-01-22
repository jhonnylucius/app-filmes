import 'package:app_filmes/controller/movie_list_controller.dart';
import 'package:app_filmes/data/models/movie.dart';
import 'package:app_filmes/screens/movie_list/widgets/movie_item_widget.dart';
import 'package:app_filmes/services/service_locator.dart';
import 'package:app_filmes/widgets/progress_indicador_widget.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class MovieListScreen extends StatefulWidget {
  const MovieListScreen({super.key});

  @override
  State<MovieListScreen> createState() => _MovieListScreenState();
}

class _MovieListScreenState extends State<MovieListScreen> {
  final controller = getIt<MovieListController>();
  final Logger logger = Logger();

  @override
  void initState() {
    controller.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Filmes'),
        actions: [
          IconButton(
            onPressed: () => controller.getMovies(),
            icon: Icon(Icons.search_sharp),
          ),
        ],
      ),
      body: StreamBuilder<List<Movie>>(
        stream: controller.stream,
        builder: (context, snapshot) {
          logger.d('StreamBuilder state: ${snapshot.connectionState}');
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const ProgressIndicadorWidget();
          }

          if (snapshot.hasError) {
            logger.e('StreamBuilder error: ${snapshot.error}');
            return const Center(child: Text('Erro ao carregar filmes'));
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            logger.d('StreamBuilder no data');
            return const Center(child: Text('Nenhum filme encontrado'));
          }

          var movies = snapshot.data!;
          logger.d('StreamBuilder data received: ${movies.length} movies');
          return ListView.builder(
            itemCount: movies.length,
            itemBuilder: (context, index) {
              var movie = movies[index];
              return MovieItemWidget(
                movie: movie,
              );
            },
          );
        },
      ),
    );
  }
}
