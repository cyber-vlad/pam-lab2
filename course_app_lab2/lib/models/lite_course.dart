class LiteCourse {
  final String id;
  final String title;
  final String institute;
  final double rating;
  final String imageUrl;

  const LiteCourse({
    required this.id,
    required this.title,
    required this.institute,
    required this.rating,
    required this.imageUrl,
  });

  factory LiteCourse.fromJson(Map<String, dynamic> json) => LiteCourse(
        id: json['id'] ?? '',
        title: json['title'] ?? '',
        institute: json['institute'] ?? '',
        rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
        imageUrl: (json['image'] ?? json['imageUrl'] ?? '') as String,
      );

  static List<LiteCourse> listFromJson(List data) =>
      data.map((e) => LiteCourse.fromJson(e as Map<String, dynamic>)).toList();
}
