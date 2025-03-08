import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../viewmodels/user_viewmodel.dart';
import 'user_detail_view.dart';

class UserListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final UserViewModel userViewModel = Get.put(UserViewModel());

    return Scaffold(
      appBar: AppBar(
        title: Text('Users'),
      ),
      body: Obx(() {
        if (userViewModel.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
            itemCount: userViewModel.users.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(userViewModel.users[index].name),
                subtitle: Text(userViewModel.users[index].email),
                onTap: () {
                  Get.to(UserDetailView(user: userViewModel.users[index]));
                },
              );
            },
          );
        }
      }),
    );
  }
}
