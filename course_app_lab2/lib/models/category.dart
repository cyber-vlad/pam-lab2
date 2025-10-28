class Category {
  final String id;
  final String name;

  const Category({required this.id, required this.name});

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json['id'] ?? '',
        name: json['name'] ?? '',
      );

  static List<Category> listFromJson(List data) =>
      data.map((e) => Category.fromJson(e as Map<String, dynamic>)).toList();
}
