import 'package:book_store_app/modules/likes/controllers/like_controller.dart';
import 'package:get/get.dart';

class LikeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LikeController());
  }
}
