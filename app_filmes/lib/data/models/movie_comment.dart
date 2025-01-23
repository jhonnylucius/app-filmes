class MovieComment {
  MovieComment({
    required this.id,
    required this.comment,
    required this.createdAt,
  });

  final int id;
  final String comment;
  final DateTime createdAt;

  factory MovieComment.fromJson(Map<String, dynamic> json) => MovieComment(
        id: json['id'],
        comment: json['comment'] ?? '',
        createdAt: DateTime.parse(json['created_at']),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'comment': comment,
        'created_at': createdAt.toIso8601String(),
      };
}
