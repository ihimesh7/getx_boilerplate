import 'package:getx_boilerplate/data/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserService {
  http.Client client = http.Client();

  static const String url = 'https://jsonplaceholder.typicode.com/users';

  Future<List<User>> fetchUsers() async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body);
      List<User> users =
          body.map((dynamic item) => User.fromJson(item)).toList();
      return users;
    } else {
      throw Exception('Failed to load users');
    }
  }
}
