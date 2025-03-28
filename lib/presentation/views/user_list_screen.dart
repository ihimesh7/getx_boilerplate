import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_boilerplate_mvvm/presentation/viewmodels/user_viewmodel.dart';
import 'user_detail_screen.dart';

// Stateless widget to display the list of users
class UserListScreen extends StatelessWidget {
  const UserListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize the UserViewModel using GetX
    final UserViewModel userViewModel = Get.put(UserViewModel());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'), // App bar title
      ),
      body: Obx(() {
        // Display a loading indicator while data is being fetched
        if (userViewModel.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else {
          // Display the list of users
          return ListView.builder(
            itemCount: userViewModel.users.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(userViewModel.users[index].name), // User name
                subtitle: Text(userViewModel.users[index].email), // User email
                onTap: () {
                  // Navigate to the user detail view on tap
                  Get.to(UserDetailScreen(user: userViewModel.users[index]));
                },
              );
            },
          );
        }
      }),
    );
  }
}
