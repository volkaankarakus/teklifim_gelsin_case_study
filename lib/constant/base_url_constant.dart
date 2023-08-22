class BaseUrlConstant {
  static BaseUrlConstant? _instance;
  static BaseUrlConstant get instance {
    _instance ??= BaseUrlConstant._init();
    return _instance!;
  }

  BaseUrlConstant._init();
  final String baseUrl = 'https://prepi.teklifimgelsin.com';
}
