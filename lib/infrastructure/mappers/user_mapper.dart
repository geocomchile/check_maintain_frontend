import 'package:check_maintain_frontend/domain/entities/user.dart';

class UserMapper {
  final String token;
  final int userId;
  final String email;
  final String username;
  final String firstName;
  final String lastName;
  final bool isStaff;
  final bool isActive;
  final bool isSuperuser;

  UserMapper({
    required this.token,
    required this.userId,
    required this.email,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.isStaff,
    required this.isActive,
    required this.isSuperuser,
  });

  static User userJsonToEntity(Map<String, dynamic> json) => User(
        token: json["token"],
        id: json["user_id"],
        email: json["email"],
        username: json["username"],
        firstName: json["first_name"],
        lastName: json["last_name"],
      );
}
