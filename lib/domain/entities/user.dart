

class User {
    final int id;
    final String token;
    final String username;
    final String firstName;
    final String lastName;
    final String email;


    User({
        required this.id,
        required this.token,
        required this.username,
        required this.firstName,
        required this.lastName,
        required this.email,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        token: json["token"],
        username: json["username"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "token": token,
        "username": username,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,

    };
}
