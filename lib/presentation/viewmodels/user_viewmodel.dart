import 'package:get/get.dart';
import 'package:getx_boilerplate/data/models/user_model.dart';
import 'package:getx_boilerplate/data/repositories/user_service.dart';

class UserViewModel extends GetxController {
  var users = <User>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchUsers();
    super.onInit();
  }

  void fetchUsers() async {
    try {
      isLoading(true);
      var usersResult = await UserService().fetchUsers();
      if (usersResult != null) {
        users.assignAll(usersResult);
      }
    } finally {
      isLoading(false);
    }
  }
}
