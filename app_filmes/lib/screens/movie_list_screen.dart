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
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.sort),
            tooltip: 'Ordenar',
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.add),
            tooltip: 'Adicionar',
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.remove),
            tooltip: 'Remover',
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.refresh),
            tooltip: 'Atualizar',
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.info),
            tooltip: 'Ajuda',
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert),
            tooltip: 'Mais',
          ),
        ],
      ),
      body: StreamBuilder<List<Movie>>(
        stream: controller.stream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text('waiting');
          }

          final movies = snapshot.data!;

          return ListView.builder(
            itemCount: movies.length,
            itemBuilder: (context, index) {
              var movie = snapshot.data![index];

              return ListTile(
                title: Text(movie.name),
                subtitle: Text(movie.description),
                trailing: Text(movie.gender.toString()),
              );
            },
          );
        },
      ),
    );
  }
}
