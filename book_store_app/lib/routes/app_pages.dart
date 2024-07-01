import 'package:book_store_app/modules/home/bindings/home_binding.dart';
import 'package:book_store_app/modules/home/views/home_view.dart';
import 'package:book_store_app/modules/likes/bindings/like_binding.dart';
import 'package:book_store_app/modules/navigation/bindings/navigation_binding.dart';
import 'package:book_store_app/modules/navigation/views/navigation_view.dart';

import 'package:get/get.dart';

import '../modules/likes/views/likes_view.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: '/navigation',
      page: () => NavigationView(),
      binding: NavigationBinding(),
    ),
    GetPage(
      name: '/home',
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: '/liked_books',
      page: () => LikesView(),
      binding: LikeBinding(),
    ),
  ];
}
