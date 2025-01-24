import 'package:app_filmes/controller/movie_detail_controller.dart';
import 'package:app_filmes/data/models/movie.dart';
import 'package:duration/duration.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class MovieDetailWidget extends StatelessWidget {
  const MovieDetailWidget({super.key, required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    final MovieDetailController controller =
        Get.put(MovieDetailController(movie), tag: movie.id.toString());

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
                  const FaIcon(FontAwesomeIcons.calendarAlt, size: 20),
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
                  const Icon(FeatherIcons.clock, size: 20),
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
                  const Icon(LineAwesomeIcons.file, size: 20),
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
                  const Icon(EvaIcons.messageCircle, size: 20),
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
