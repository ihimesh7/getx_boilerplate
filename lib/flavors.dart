enum Flavor {
  dev,
  staging,
  production,
}

class F {
  static late final Flavor appFlavor;

  static String get name => appFlavor.name;

  static String get title {
    switch (appFlavor) {
      case Flavor.dev:
        return 'Getx Boilerplate Dev';
      case Flavor.staging:
        return 'Getx Boilerplate Staging';
      case Flavor.production:
        return 'Getx Boilerplate';
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
