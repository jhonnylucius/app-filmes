class MovieComment {
  MovieComment({
    required this.id,
    required this.comment,
    required this.createdAt,
  });

  final int id;
  final String comment;
  final DateTime createdAt; // Changed from date to createdAt

  factory MovieComment.fromJson(Map<String, dynamic> json) => MovieComment(
        id: json['id'],
        comment: json['comment'],
        createdAt: json['data_created'],
      );
}
