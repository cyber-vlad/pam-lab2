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

  Course({
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

  Course copyWith({
    String? id,
    String? title,
    String? institute,
    String? rating,
    String? imageUrl,
    String? price,
    String? description,
    String? lectures,
    String? learningTime,
    String? certification,
    List<String>? skills,
    String? enrolledStudents,
    Instructor? instructor,
    List<Lesson>? lessons,
    List<RelatedCourse>? relatedCourses,
  }) {
    return Course(
      id: id ?? this.id,
      title: title ?? this.title,
      institute: institute ?? this.institute,
      rating: rating ?? this.rating,
      imageUrl: imageUrl ?? this.imageUrl,
      price: price ?? this.price,
      description: description ?? this.description,
      lectures: lectures ?? this.lectures,
      learningTime: learningTime ?? this.learningTime,
      certification: certification ?? this.certification,
      skills: skills ?? this.skills,
      enrolledStudents: enrolledStudents ?? this.enrolledStudents,
      instructor: instructor ?? this.instructor,
      lessons: lessons ?? this.lessons,
      relatedCourses: relatedCourses ?? this.relatedCourses,
    );
  }
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

  factory Instructor.fromJson(Map<String, dynamic> json) => Instructor(
        name: json['name'] ?? '',
        title: json['title'] ?? '',
        bio: json['bio'] ?? '',
        imageUrl: (json['image'] ?? json['imageUrl'] ?? '') as String,
      );
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

  factory Lesson.fromJson(Map<String, dynamic> json) => Lesson(
        id: json['id'] ?? '',
        title: json['title'] ?? '',
        duration: json['duration'] ?? '',
        isPreview: json['isPreview'] == true,
      );
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

  factory RelatedCourse.fromJson(Map<String, dynamic> json) => RelatedCourse(
        id: json['id'] ?? '',
        title: json['title'] ?? '',
        institute: json['institute'] ?? '',
        imageUrl: (json['image'] ?? json['imageUrl'] ?? '') as String,
        rating: (json['rating'] ?? '').toString(),
        price: json['price'] != null
            ? '${json['price']} ${json['currency'] ?? 'USD'}'
            : '',
      );
}
