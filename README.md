# App Demo

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

# Generate locale key
flutter pub run easy_localization:generate -s "asset/langs" -f keys -o locale_key.g.dart

# Generate json_serializable
flutter packages pub run build_runner build --delete-conflicting-outputs

# Architecture
MVVM + MVP + Repository Pattern

# Dependencies
- [GetX](https://pub.dev/packages/get)
- [Easy Localization](https://pub.dev/packages/easy_localization)
- [Json Serializable](https://pub.dev/packages/json_serializable)
- [Http](https://pub.dev/packages/http)
- [Flutter Picker](https://pub.dev/packages/flutter_picker)
