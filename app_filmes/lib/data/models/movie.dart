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
  final List<String> comments;

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
        id: json['id'] ?? 0,
        name: json['titulo'] ?? '',
        year: json['ano'] ?? 0,
        duration: json['duracao'] ?? 0,
        description: json['sinopse'] ?? '',
        gender: json['genero'] ?? '',
        urlImage: json['urlImagem'] ?? '',
        comments: List<String>.from(json['comentarios'] ?? []),
      );
}
