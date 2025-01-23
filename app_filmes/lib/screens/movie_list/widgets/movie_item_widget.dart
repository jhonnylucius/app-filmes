import 'package:animations/animations.dart';
import 'package:app_filmes/data/models/movie.dart';
import 'package:app_filmes/screens/movie_detail/widgets/movie_datail_widget.dart';
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
      openBuilder: (context, action) => MovieDetailWidget(movie: movie),
    );
  }
}
