enum Flavor {
  dev,
  staging,
  production,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

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
