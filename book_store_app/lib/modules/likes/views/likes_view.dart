import 'package:book_store_app/data/models/book_model.dart';
import 'package:book_store_app/modules/likes/controllers/like_controller.dart';
import 'package:book_store_app/utils/view_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constants.dart';
import '../../home/widgets/book_item.dart';

class LikesView extends StatelessWidget {
  LikesView({super.key});

  final LikeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Obx(() {
      switch (controller.viewState.value) {
        case ViewState.loading:
          return const Center(child: CircularProgressIndicator());
        case ViewState.error:
          return Center(
              child: Text('Error: ${controller.error.value}',
                  style: const TextStyle(color: Colors.red)));
        case ViewState.success:
          return ListView.builder(
            itemCount: controller.likeBooks.length,
            itemBuilder: (context, index) {
              final book = controller.likeBooks[index];
              final isLiked = controller.isBookLiked(book ?? Books()).obs;
              return BookItem(
                book: book ?? Books(),
                onLike: () {
                  if (controller.isBookLiked(book ?? Books())) {
                    controller.removeFromLikes(book ?? Books());
                  } else {
                    controller.addBookToLikes(book ?? Books());
                  }
                  isLiked.value = !isLiked.value;
                },
                isLiked: isLiked,
              );
            },
          );
        case ViewState.empty:
          return const Center(
              child: Text(AppStrings.dataIsEmpty,
                  style: TextStyle(color: Colors.black)));
        default:
          return Container();
      }
    }));
  }
}
