import 'package:flutter_test/flutter_test.dart';
import 'package:getx_boilerplate/data/repositories/user_service.dart';
import 'package:getx_boilerplate/presentation/viewmodels/user_viewmodel.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'dart:convert';

void main() {
  group('UserViewModel Tests', () {
    // Test case to verify fetching users successfully
    test('Fetch users', () async {
      final userService = UserService();
      userService.client = MockClient((request) async {
        return http.Response(
            json.encode([
              {
                'id': 1,
                'name': 'John Doe',
                'username': 'johndoe',
                'email': 'john@example.com'
              }
            ]),
            200);
      });

      final userViewModel = UserViewModel();
      userViewModel.fetchUsers();

      expect(userViewModel.users.length, 1);
      expect(userViewModel.users[0].name, 'John Doe');
    });

    // Test case to verify fetching users with an empty response
    test('Fetch users with empty response', () async {
      final userService = UserService();
      userService.client = MockClient((request) async {
        return http.Response(json.encode([]), 200);
      });

      final userViewModel = UserViewModel();
      userViewModel.fetchUsers();

      expect(userViewModel.users.length, 0);
    });

    // Test case to verify fetching users with an error response
    test('Fetch users with error response', () async {
      final userService = UserService();
      userService.client = MockClient((request) async {
        return http.Response('Internal Server Error', 500);
      });

      final userViewModel = UserViewModel();
      userViewModel.fetchUsers();

      expect(userViewModel.users.length, 0);
    });

    // Test case to verify the loading state during fetch
    test('Loading state during fetch', () async {
      final userService = UserService();
      userService.client = MockClient((request) async {
        return http.Response(
            json.encode([
              {
                'id': 1,
                'name': 'John Doe',
                'username': 'johndoe',
                'email': 'john@example.com'
              }
            ]),
            200);
      });

      final userViewModel = UserViewModel();
      expect(userViewModel.isLoading.value, true);
      userViewModel.fetchUsers();
      expect(userViewModel.isLoading.value, false);
    });
  });
}
