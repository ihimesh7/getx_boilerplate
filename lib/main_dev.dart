// Import the flavors configuration
import 'flavors.dart';

// Import the main runner file
import 'main.dart' as runner;

Future<void> main() async {
  // Set the app flavor to development
  F.appFlavor = Flavor.dev;
  
  // Run the main function from the runner
  await runner.main();
}
