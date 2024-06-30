import 'package:book_store_app/modules/home/controlers/home_controller.dart';
import 'package:book_store_app/modules/home/widgets/book_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constants.dart';
import '../../../utils/view_state.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.appName)),
      body: Obx(() {
        switch (controller.viewState.value) {
          case ViewState.loading:
            return const Center(child: CircularProgressIndicator());
          case ViewState.error:
            return Center(
                child: Text('Error: ${controller.error.value}',
                    style: const TextStyle(color: Colors.red)));
          case ViewState.success:
            return ListView.builder(
              itemCount: controller.books.length,
              itemBuilder: (context, index) {
                return BookItem(book: controller.books[index]);
              },
            );
          default:
            return Container();
        }
      }),
    );
  }
}
