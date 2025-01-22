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
            onPressed: () {},
            icon: Icon(Icons.search),
            tooltip: 'Buscar',
          ),
        ],
      ),
      body: StreamBuilder<List<Movie>>(
        stream: controller.stream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(
              child: Text('Erro ao carregar filmes: ${snapshot.error}'),
            );
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
                title: Text(movie.name),
              );
            },
          );
        },
      ),
    );
  }
}
