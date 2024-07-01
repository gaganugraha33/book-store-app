import 'package:book_store_app/modules/home/controllers/home_controller.dart';
import 'package:book_store_app/modules/likes/controllers/like_controller.dart';
import 'package:book_store_app/modules/navigation/controllers/navigation_controller.dart';
import 'package:get/get.dart';

class NavigationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NavigationController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => LikeController());
  }
}
