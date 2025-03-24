import 'package:getx_boilerplate_mvvm/data/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserService {
  // Create an HTTP client instance
  http.Client client = http.Client();

  // URL to fetch users from
  static const String url = 'https://jsonplaceholder.typicode.com/users';

  // Fetch users from the API
  Future<List<User>> fetchUsers() async {
    // Make a GET request to the URL
    final response = await http.get(Uri.parse(url));
    
    // Check if the request was successful
    if (response.statusCode == 200) {
      // Parse the response body as JSON
      List<dynamic> body = json.decode(response.body);
      
      // Convert the JSON to a list of User objects
      List<User> users =
          body.map((dynamic item) => User.fromJson(item)).toList();
      
      // Return the list of users
      return users;
    } else {
      // Throw an exception if the request failed
      throw Exception('Failed to load users');
    }
  }
}
