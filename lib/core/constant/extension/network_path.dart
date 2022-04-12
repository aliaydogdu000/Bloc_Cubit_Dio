enum IHomeServicePath { homePath }

extension IHomeServiceExtension on IHomeServicePath {
  String get rawValue {
    switch (this) {
      case IHomeServicePath.homePath:
        return "/api/users?page=2";
    }
  }
}
