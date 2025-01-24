import 'package:app_filmes/controller/movie_list_controller.dart';
import 'package:app_filmes/data/models/movie.dart';
import 'package:app_filmes/screens/movie_list/widgets/movie_item_widget.dart';
import 'package:app_filmes/screens/movie_list/widgets/search_dialog.dart';
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
  int _currentPage = 0;

  @override
  void initState() {
    controller.init();
    super.initState();
  }

  void _openSearchDialog() async {
    final result = await showDialog(
      context: context,
      builder: (context) => const SearchDialog(),
    );

    if (result != null) {
      controller.searchMovies(result);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Filmes'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: _openSearchDialog,
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
          return Stack(
            children: [
              // Imagem de fundo
              Positioned.fill(
                child: Image.network(
                  movies[_currentPage].urlImage,
                  fit: BoxFit.cover,
                ),
              ),
              // Sombra para melhorar a legibilidade do texto
              Positioned.fill(
                child: Container(
                  color: Colors.black.withAlpha(128),
                ),
              ),
              // Conteúdo principal
              Column(
                children: [
                  const SizedBox(height: 16),
                  const Spacer(),
                  // Lista de filmes
                  SizedBox(
                    height: 300, // Aumentar a altura do PageView
                    child: PageView.builder(
                      itemCount: movies.length,
                      controller: PageController(viewportFraction: 0.3),
                      onPageChanged: (int index) {
                        setState(() {
                          _currentPage = index;
                        });
                      },
                      itemBuilder: (context, index) {
                        return Transform.scale(
                          scale: index == _currentPage ? 1.0 : 0.8,
                          child: MovieItemWidget(movie: movies[index]),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
