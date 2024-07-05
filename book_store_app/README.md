[# book_store_app

Apps for search information about books from [Gutendex](https://gutendex.com/)

## Supported Devices

- Suported Device Android with OS minimum Nougat (24)
- Supported Device IOS with OS minimum (12)


## Supported Features & Library

- [get](https://pub.dev/packages/get/versions/4.6.6) for state management.
- [dio](https://pub.dev/packages/dio/versions/5.4.3+1) using for request data, is a powerful HTTP client for the Dart programming language, which is commonly used in Flutter applications. It provides a variety of features for making network requests and handling responses.
- [flutter_dotenv](https://pub.dev/packages/flutter_dotenv/versions/5.1.0) is a Flutter package that allows you to load environment variables from a .env file in your Flutter application.
- [hive](https://pub.dev/packages/hive/versions/2.2.3) package is a lightweight and blazing fast key-value database written in pure Dart. It's an ideal solution for storing structured data in Flutter applications, offering a high-performance and low-overhead approach to data storage.
- [hive_flutter](https://pub.dev/packages/hive_flutter/versions/1.1.0) package is a Flutter plugin for the Hive database, providing additional functionality specifically tailored for Flutter applications. It simplifies the integration of Hive with Flutter by adding features such as Flutter-specific initializations and utilities.
- [cached_network_image](https://pub.dev/packages/cached_network_image/versions/3.3.1) package is a Flutter library that provides an advanced way to load images from the network with caching support.

## Requirements to build the app

- Flutter (Channel stable, 3.22.0, on macOS 14.3.1 23D60 darwin-arm64, locale en-ID)
- Android toolchain - develop for Android devices (Android SDK version 34.0.0)
- Xcode - develop for iOS and macOS (Xcode 15.2)


## Instructions to build and deploy the app

run project using this command :

```bash
flutter pub get
flutter run
```

for build apk release :

```bash
flutter build apk --release
```
