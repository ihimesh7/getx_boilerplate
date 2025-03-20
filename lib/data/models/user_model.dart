/// A model class representing a User.
class User {
  /// The unique identifier of the user.
  final int id;

  /// The name of the user.
  final String name;

  /// The username of the user.
  final String username;

  /// The email address of the user.
  final String email;

  /// Creates a new User instance.
  ///
  /// All parameters are required.
  User(
      {required this.id,
      required this.name,
      required this.username,
      required this.email});

  /// Creates a new User instance from a JSON object.
  ///
  /// The [json] parameter must contain the keys 'id', 'name', 'username', and 'email'.
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      username: json['username'],
      email: json['email'],
    );
  }
}
