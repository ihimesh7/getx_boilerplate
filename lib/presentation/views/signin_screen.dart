import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Import GetX package

class SignInScreen extends StatelessWidget {
  final String email;
  final TextEditingController emailController;
  final TextEditingController passwordController = TextEditingController();

  SignInScreen({super.key, required this.email})
      : emailController = TextEditingController(text: email);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final email = emailController.text;
                final password = passwordController.text;

                // Validate email and password using GetX
                if (GetUtils.isEmail(email) &&  password.isNotEmpty) {
                  // Show success snackbar if validation passes
                  Get.snackbar('Success', 'Validation passed',
                      snackPosition: SnackPosition.BOTTOM);
                } else {
                  // Show error snackbar if validation fails
                  Get.snackbar('Error', 'Invalid email or password',
                      snackPosition: SnackPosition.BOTTOM);
                }
              },
              child: const Icon(Icons.arrow_right),
            ),
          ],
        ),
      ),
    );
  }
}
