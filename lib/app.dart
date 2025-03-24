import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_boilerplate_mvvm/presentation/views/user_list_screen.dart';
import 'flavors.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // Disable the debug banner
      debugShowCheckedModeBanner: false,
      // Set the application title
      title: F.title,
      // Define the theme of the application
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // Set the initial route
      initialRoute: '/',
      // Define the available pages
      getPages: [
        GetPage(name: '/', page: () => const UserListScreen()),
      ],
      // Display the flavor banner if in debug mode
      home: _flavorBanner(
        child: const UserListScreen(),
        show: kDebugMode,
      ),
    );
  }

  Widget _flavorBanner({required Widget child, bool show = true}) => show
      ? Banner(
          location: BannerLocation.topStart,
          message: F.name,
          color: Colors.green.withAlpha(150),
          textStyle: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 12.0,
            letterSpacing: 1.0,
          ),
          textDirection: TextDirection.ltr,
          child: child,
        )
      : Container(child: child);
}
