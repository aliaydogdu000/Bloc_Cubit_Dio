class StringConstants {
  static StringConstants? _instace;
  static StringConstants get instance {
    _instace ??= StringConstants._init();
    return _instace!;
  }

  StringConstants._init();

  static const baseUrl = "https://reqres.in/";
  static const title = "DJ OF THE UNIVERSE";
}
