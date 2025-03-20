// Import necessary packages
import 'dart:async';
import 'package:flutter/material.dart';
import 'app.dart';

// Main function to initialize the app
FutureOr<void> main() async {
  // Ensure Flutter bindings are initialized
  WidgetsFlutterBinding.ensureInitialized();
  
  // Run the app
  runApp(const App());
}