// Import the flavors configuration
import 'flavors.dart';

// Import the main runner file
import 'main.dart' as runner;

Future<void> main() async {
  // Set the app flavor to production
  F.appFlavor = Flavor.production;
  
  // Run the main function from the runner
  await runner.main();
}
