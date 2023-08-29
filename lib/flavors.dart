enum Flavor {
  exampledev,
  examplestaging,
  example,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.exampledev:
        return 'Example App - Dev';
      case Flavor.examplestaging:
        return 'Example App - Staging';
      case Flavor.example:
        return 'Example App';
      default:
        return 'title';
    }
  }

}
