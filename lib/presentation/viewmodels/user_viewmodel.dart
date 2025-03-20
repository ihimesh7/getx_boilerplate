import 'package:get/get.dart';
import 'package:getx_boilerplate/data/models/user_model.dart';
import 'package:getx_boilerplate/data/repositories/user_service.dart';

/// ViewModel for managing user data and state
class UserViewModel extends GetxController {
  // Observable list of users
  var users = <User>[].obs;
  // Observable loading state
  var isLoading = true.obs;

  @override
  void onInit() {
    // Fetch users when the ViewModel is initialized
    fetchUsers();
    super.onInit();
  }

  /// Fetches users from the UserService and updates the state
  void fetchUsers() async {
    try {
      isLoading(true); // Set loading state to true
      var usersResult = await UserService().fetchUsers();
      if (usersResult != null) {
        users.assignAll(usersResult); // Update users list
      }
    } finally {
      isLoading(false); // Set loading state to false
    }
  }
}
