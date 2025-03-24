import 'package:flutter/material.dart';
import 'package:get/get.dart'; 
import 'package:getx_boilerplate_mvvm/data/models/user_model.dart' show User;
import 'package:getx_boilerplate_mvvm/presentation/views/signin_screen.dart'; 

/// View for displaying details of a user
class UserDetailScreen extends StatelessWidget {
  final User user;

  const UserDetailScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user.name), // Display user's name in the app bar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Username: ${user.username}', style: const TextStyle(fontSize: 18)), // Display user's username
            const SizedBox(height: 8),
            Text('Email: ${user.email}', style: const TextStyle(fontSize: 18)), // Display user's email
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                // Navigate to SignInScreen with the user's email using GetX
                Get.to(() => SignInScreen(email: user.email));
              },
              child: const Text('Sign in with this ID'),
            ),
          ],
        ),
      ),
    );
  }
}
