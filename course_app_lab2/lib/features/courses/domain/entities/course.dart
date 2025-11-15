class Course {
  final String id;
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
  final String? enrolledStudents;

  final Instructor? instructor;
  final List<Lesson> lessons;
  final List<RelatedCourse> relatedCourses;

  const Course({
    required this.id,
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
    this.enrolledStudents,
    this.instructor,
    this.lessons = const [],
    this.relatedCourses = const [],
  });
}

class Instructor {
  final String name;
  final String title;
  final String bio;
  final String imageUrl;

  const Instructor({
    required this.name,
    required this.title,
    required this.bio,
    required this.imageUrl,
  });
}

class Lesson {
  final String id;
  final String title;
  final String duration;
  final bool isPreview;

  const Lesson({
    required this.id,
    required this.title,
    required this.duration,
    required this.isPreview,
  });
}

class RelatedCourse {
  final String id;
  final String title;
  final String institute;
  final String imageUrl;
  final String rating;
  final String price;

  const RelatedCourse({
    required this.id,
    required this.title,
    required this.institute,
    required this.imageUrl,
    required this.rating,
    required this.price,
  });
}
