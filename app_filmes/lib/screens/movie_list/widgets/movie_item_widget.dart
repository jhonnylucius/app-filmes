import 'package:app_filmes/data/models/movie.dart';
import 'package:flutter/material.dart';

class MovieItemWidget extends StatelessWidget {
  const MovieItemWidget({super.key, required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 8),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(2.0),
            child: Image.network(
              movie.urlImage,
              fit: BoxFit.cover,
              width: 120,
              height: 154,
            ),
          ),
        ),
        const SizedBox(
          width: 4.0,
        ),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(movie.name, style: TextStyle(fontSize: 12.0)),
              Text(movie.description, style: TextStyle(fontSize: 10.0)),
              SizedBox(height: 4.0),
              Text(movie.gender, style: TextStyle(fontSize: 12.0)),
              SizedBox(height: 4.0),
            ],
          ),
        )
      ],
    );
  }
}
