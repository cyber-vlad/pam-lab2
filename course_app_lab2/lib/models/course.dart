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

  factory Course.fromJson(Map<String, dynamic> json) => Course(
        title: json['title'],
        institute: json['institute'],
        rating: json['rating'],
        imageUrl: json['imageUrl'],
        price: json['price'],
        description: json['description'],
        lectures: json['lectures'],
        learningTime: json['learningTime'],
        certification: json['certification'],
        skills: (json['skills'] as List?)?.cast<String>() ?? const [],
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'institute': institute,
        'rating': rating,
        'imageUrl': imageUrl,
        'price': price,
        'description': description,
        'lectures': lectures,
        'learningTime': learningTime,
        'certification': certification,
        'skills': skills,
      };

  static List<Course> listFromJson(List data) =>
      data.map((e) => Course.fromJson(e as Map<String, dynamic>)).toList();
}
