import 'package:app_filmes/controller/movie_detail_controller.dart';
import 'package:app_filmes/data/models/movie.dart';
import 'package:duration/duration.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class MovieDetailWidget extends StatelessWidget {
  const MovieDetailWidget({super.key, required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    final MovieDetailController controller =
        Get.put(MovieDetailController(movie), tag: movie.id.toString());
    final TextEditingController commentController = TextEditingController();

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
              Row(
                children: [
                  const FaIcon(FontAwesomeIcons.calendarDays,
                      size: 20, color: Colors.orange),
                  const SizedBox(width: 8),
                  Text(
                    'Ano: ${movie.year}',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const FaIcon(FontAwesomeIcons.clock,
                      size: 20, color: Colors.orange),
                  const SizedBox(width: 8),
                  Text(
                    'Duração: ${prettyDuration(Duration(minutes: movie.duration), abbreviated: true, delimiter: ' ', spacer: '')}',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const FaIcon(FontAwesomeIcons.film,
                      size: 20, color: Colors.orange),
                  const SizedBox(width: 8),
                  Text(
                    'Gênero: ${movie.gender}',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                movie.description,
                textAlign: TextAlign.justify,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  const FaIcon(FontAwesomeIcons.comments,
                      size: 20, color: Colors.orange),
                  const SizedBox(width: 8),
                  Text(
                    'Comentários:',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ],
              ),
              const SizedBox(height: 8),
              GetBuilder<MovieDetailController>(
                tag: movie.id.toString(),
                builder: (controller) {
                  if (controller.comments.isEmpty) {
                    return const Text(
                      'Seja o primeiro a Comentar...',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    );
                  } else {
                    return Column(
                      children:
                          controller.comments.asMap().entries.map((entry) {
                        final comment = entry.value;
                        final formattedDate = DateFormat('dd/MM/yyyy HH:mm')
                            .format(comment.createdAt);
                        return ListTile(
                          title: Text(comment.comment),
                          subtitle: Text(
                            formattedDate,
                            style: const TextStyle(
                                fontSize: 12, color: Colors.grey),
                          ),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              controller.removeComment(entry.key);
                            },
                          ),
                        );
                      }).toList(),
                    );
                  }
                },
              ),
              const SizedBox(height: 16),
              TextField(
                controller: commentController,
                onChanged: controller.setNewComment,
                decoration: const InputDecoration(
                  labelText: 'Adicionar Comentário',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange, // Cor de destaque
                ),
                onPressed: () {
                  controller.addComment();
                  // Limpar o campo de comentário
                  commentController.clear();
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
