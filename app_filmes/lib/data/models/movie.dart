import 'movie_comment.dart';

class Movie {
  Movie({
    required this.id,
    required this.name,
    required this.year,
    required this.duration,
    required this.description,
    required this.gender,
    required this.urlImage,
    required this.comments,
  });

  final int id;
  final String name;
  final int year;
  final int duration;
  final String description;
  final String gender;
  final String urlImage;
  final List<MovieComment> comments;

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
        id: json['id'],
        name: json['name'],
        year: json['year'],
        duration: json['duration'],
        description: json['description'],
        gender: json['gender'],
        urlImage: json['url_image'],
        comments: json['comments'] != null
            ? List<MovieComment>.from(
                json['comments'].map((x) => MovieComment.fromJson(x)))
            : [],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'year': year,
        'duration': duration,
        'description': description,
        'gender': gender,
        'url_image': urlImage,
        'comments': List<dynamic>.from(comments.map((x) => x.toJson())),
      };
}
