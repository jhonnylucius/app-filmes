import 'package:app_filmes/data/models/movie.dart';
import 'package:app_filmes/data/models/movie_comment.dart';
import 'package:get/get.dart';

class MovieDetailController extends GetxController {
  final Movie movie;
  MovieDetailController(this.movie);

  final _newComment = ''.obs;

  List<MovieComment> get comments => movie.comments;
  String get newComment => _newComment.value;

  void setNewComment(String comment) {
    _newComment.value = comment;
  }

  void addComment() {
    if (_newComment.value.isNotEmpty) {
      movie.comments.add(MovieComment(
        id: movie.comments.length + 1,
        comment: _newComment.value,
        createdAt: DateTime.now(),
      ));
      _newComment.value = '';
      update(); // Atualiza a interface
    }
  }

  void removeComment(int index) {
    if (index >= 0 && index < movie.comments.length) {
      movie.comments.removeAt(index);
      update(); // Atualiza a interface
    }
  }
}
