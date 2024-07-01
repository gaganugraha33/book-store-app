import 'package:book_store_app/modules/navigation/controllers/navigation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../home/views/home_view.dart';
import '../../likes/views/likes_view.dart';

class NavigationView extends StatelessWidget {
  NavigationView({super.key});

  final NavigationController controller = Get.find();

  final List<Widget> pages = [
    HomeView(),
    LikesView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return IndexedStack(
          index: controller.selectedIndex.value,
          children: pages,
        );
      }),
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
            currentIndex: controller.selectedIndex.value,
            onTap: controller.changePage,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: 'Likes',
              ),
            ]);
      }),
    );
  }
}
