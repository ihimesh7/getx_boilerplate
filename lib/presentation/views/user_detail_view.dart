import 'package:flutter/material.dart';
import 'package:getx_boilerplate/data/models/user_model.dart';

/// View for displaying details of a user
class UserDetailView extends StatelessWidget {
  final User user;

  const UserDetailView({super.key, required this.user});

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
          ],
        ),
      ),
    );
  }
}
