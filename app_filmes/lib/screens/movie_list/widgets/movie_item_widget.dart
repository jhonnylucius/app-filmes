import 'package:animations/animations.dart';
import 'package:app_filmes/data/models/movie.dart';
import 'package:duration/duration.dart';
import 'package:flutter/material.dart';

class MovieItemWidget extends StatelessWidget {
  const MovieItemWidget({super.key, required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      closedElevation: 0,
      openElevation: 0,
      transitionType: ContainerTransitionType.fadeThrough,
      closedBuilder: (context, action) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.network(
            movie.urlImage,
            fit: BoxFit.cover,
          ),
        ),
      ),
      openBuilder: (context, action) => Scaffold(
        appBar: AppBar(
          title: Text(movie.name),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.network(
                    movie.urlImage,
                    width: 200,
                    height: 260,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Ano: ${movie.year}',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(height: 8),
                Text(
                  'Duração: ${prettyDuration(Duration(minutes: movie.duration), abbreviated: true, delimiter: ' ', spacer: '')}',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(height: 8),
                Text(
                  'Gênero: ${movie.gender}',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(height: 8),
                Text(
                  movie.description,
                  textAlign: TextAlign.justify,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 8),
                Text(
                  'Comentários: ${(movie.comments as String?) ?? 'Sem Comentários'}',
                  textAlign: TextAlign.justify,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
