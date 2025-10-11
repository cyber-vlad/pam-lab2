class Course {
  final String title;
  final String institute;
  final String rating;
  final String imageUrl;
  final String price;
  final String description;
  final String lectures;
  final String learningTime;
  final String certification;
  final List<String> skills;

  Course({
    required this.title,
    required this.institute,
    required this.rating,
    required this.imageUrl,
    required this.price,
    required this.description,
    required this.lectures,
    required this.learningTime,
    required this.certification,
    required this.skills,
  });
}