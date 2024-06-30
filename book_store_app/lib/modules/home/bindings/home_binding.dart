import 'package:book_store_app/modules/home/controlers/home_controller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings{
  @override
  void dependencies() {
   Get.lazyPut(() => HomeController());
  }
}