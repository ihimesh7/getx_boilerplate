// Enum representing different app flavors
enum Flavor {
  dev,
  staging,
  production,
}

// Class to manage app flavor-specific configurations
class F {
  // The current app flavor
  static Flavor? appFlavor;

  // Get the name of the current app flavor
  static String get name => appFlavor?.name ?? '';

  // Get the title based on the current app flavor
  static String get title {
    switch (appFlavor) {
      case Flavor.dev:
        return 'Getx Boilerplate Dev';
      case Flavor.staging:
        return 'Getx Boilerplate Staging';
      case Flavor.production:
        return 'Getx Boilerplate';
      default:
        return 'title';
    }
  }

  // Get the base URL based on the current app flavor
  static String get baseUrl {
    switch (appFlavor) {
      case Flavor.dev:
        return 'https://jsonplaceholder.typicode.com';
      case Flavor.staging:
        return 'https://jsonplaceholder.typicode.com';
      case Flavor.production:
        return 'https://jsonplaceholder.typicode.com';
      default:
        return 'https://jsonplaceholder.typicode.com';
    }
  }
}
