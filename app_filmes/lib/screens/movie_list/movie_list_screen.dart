import 'package:app_filmes/controller/movie_list_controller.dart';
import 'package:app_filmes/data/models/movie.dart';
import 'package:app_filmes/services/service_locator.dart';
import 'package:flutter/material.dart';

class MovieListScreen extends StatefulWidget {
  const MovieListScreen({super.key});

  @override
  State<MovieListScreen> createState() => _MovieListScreenState();
}

class _MovieListScreenState extends State<MovieListScreen> {
  final controller = getIt<MovieListController>();

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
            icon: Icon(Icons.refresh),
            tooltip: 'Atualizar',
          ),
        ],
      ),
      body: StreamBuilder<List<Movie>>(
        stream: controller.stream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Nenhum filme encontrado'));
          }

          var movies = snapshot.data!;
          return ListView.builder(
            itemCount: movies.length,
            itemBuilder: (context, index) {
              var movie = movies[index];
              return ListTile(
                leading: Image.network(
                  movie.urlImage,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
                title: Text(movie.name),
                subtitle: Text(movie.description),
              );
            },
          );
        },
      ),
    );
  }
}
