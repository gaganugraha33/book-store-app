import 'package:book_store_app/modules/home/bindings/home_binding.dart';
import 'package:book_store_app/modules/home/views/home_view.dart';
import 'package:get/get.dart';

class AppPages {
  static final routes = [
    GetPage(name: '/', page: () => HomeView(), binding: HomeBinding())
  ];
}
