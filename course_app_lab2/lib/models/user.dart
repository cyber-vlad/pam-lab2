class User {
  final String name;
  final int notifications;

  const User({required this.name, required this.notifications});

  factory User.fromJson(Map<String, dynamic> json) => User(
        name: json['name'] ?? '',
        notifications: json['notifications'] ?? '',
      );

  static List<User> listFromJson(List data) =>
      data.map((e) => User.fromJson(e as Map<String, dynamic>)).toList();
}
