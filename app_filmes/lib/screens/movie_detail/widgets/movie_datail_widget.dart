import 'package:app_filmes/controller/movie_detail_controller.dart';
import 'package:app_filmes/data/models/movie.dart';
import 'package:duration/duration.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MovieDetailWidget extends StatelessWidget {
  const MovieDetailWidget({super.key, required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    final MovieDetailController controller =
        Get.put(MovieDetailController(movie));

    return Scaffold(
      appBar: AppBar(
        title: Text(movie.name),
        leading: IconButton(
          icon: const Icon(Icons.close),
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
              const SizedBox(height: 16),
              Text(
                'Comentários:',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(height: 8),
              GetBuilder<MovieDetailController>(
                builder: (controller) {
                  return Column(
                    children: controller.comments
                        .asMap()
                        .entries
                        .map((entry) => ListTile(
                              title: Text(entry.value.comment),
                              trailing: IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () {
                                  controller.removeComment(entry.key);
                                },
                              ),
                            ))
                        .toList(),
                  );
                },
              ),
              const SizedBox(height: 16),
              TextField(
                onChanged: controller.setNewComment,
                controller: TextEditingController(text: controller.newComment),
                decoration: const InputDecoration(
                  labelText: 'Adicionar Comentário',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  controller.addComment();
                  // Limpar o campo de comentário
                  controller.setNewComment('');
                },
                child: const Text('Adicionar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
