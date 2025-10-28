class CourseDetails {
  final String id;
  final String title;
  final String institute;
  final double price;
  final String currency;
  final int enrolledStudents;
  final double rating;
  final int lectures;
  final String duration;
  final String certification;
  final String thumbnail;
  final String previewVideo;
  final String description;
  final List<String> skills;

  const CourseDetails({
    required this.id,
    required this.title,
    required this.institute,
    required this.price,
    required this.currency,
    required this.enrolledStudents,
    required this.rating,
    required this.lectures,
    required this.duration,
    required this.certification,
    required this.thumbnail,
    required this.previewVideo,
    required this.description,
    required this.skills,
  });

  factory CourseDetails.fromJson(Map<String, dynamic> json) {
    final Map<String, dynamic> src = json['details']?['course'] ?? json;

    return CourseDetails(
      id: src['id'] ?? '',
      title: src['title'] ?? '',
      institute: src['institute'] ?? '',
      price: (src['price'] as num?)?.toDouble() ?? 0.0,
      currency: src['currency'] ?? '',
      enrolledStudents: (src['enrolledStudents'] as num?)?.toInt() ?? 0,
      rating: (src['rating'] as num?)?.toDouble() ?? 0.0,
      lectures: (src['lectures'] as num?)?.toInt() ?? 0,
      duration: src['duration'] ?? '',
      certification: src['certification'] ?? '',
      thumbnail: (src['thumbnail'] ?? src['image'] ?? src['imageUrl'] ?? '') as String,
      previewVideo: src['previewVideo'] ?? '',
      description: src['description'] ?? '',
      skills: (src['skills'] as List?)?.cast<String>() ?? const [],
    );
  }
}
