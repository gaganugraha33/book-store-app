import 'package:book_store_app/modules/home/bindings/home_binding.dart';
import 'package:book_store_app/modules/home/views/home_view.dart';
import 'package:book_store_app/modules/likes/bindings/like_binding.dart';

import 'package:get/get.dart';

import '../modules/likes/views/likes_view.dart';

class AppPages {
  static final routes = [
    GetPage(name: '/', page: () => HomeView(), binding: HomeBinding()),
    GetPage(
        name: 'liked_books', page: () => LikesView(), binding: LikeBinding())
  ];
}