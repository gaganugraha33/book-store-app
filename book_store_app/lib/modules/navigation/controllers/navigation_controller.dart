import 'package:book_store_app/modules/home/controllers/home_controller.dart';
import 'package:book_store_app/modules/likes/controllers/like_controller.dart';
import 'package:get/get.dart';

class NavigationController extends GetxController {
  final LikeController likeController = Get.find();
  final HomeController homeController = Get.find();

  var selectedIndex = 0.obs;

  void changePage(int index) {
    if (index == 0) {
      homeController.onInit();
    } else {
      likeController.onInit();
    }

    selectedIndex.value = index;
  }
}
