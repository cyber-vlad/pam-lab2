import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:course_app_lab2/models/user.dart';

class UserRepository {
  static User? _cachedUser;

  Future<User> loadUser() async {
    if (_cachedUser != null) return _cachedUser!;

    final raw = await rootBundle.loadString('assets/data/user_data.json');
    final Map<String, dynamic> data = jsonDecode(raw);

    final userJson = (data['user'] as Map<String, dynamic>?) ?? {};
    _cachedUser = User.fromJson(userJson);

    return _cachedUser!;
  }
}
