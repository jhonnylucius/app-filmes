class MovieComment {
  final int id;
  final String comment;
  final DateTime createdAt; // Changed from date to createdAt

  MovieComment({
    required this.id,
    required this.comment,
    required this.createdAt,
  });

  factory MovieComment.fromJson(Map<String, dynamic> json) => MovieComment(
        id: json['id'],
        comment: json['comment'],
        createdAt: json['data_created'],
      );
}
