import 'package:book_store_app/data/models/book_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookItem extends StatelessWidget {
  final Books book;
  final VoidCallback onLike;
  final RxBool isLiked;

  const BookItem({
    super.key,
    required this.book,
    required this.onLike,
    required this.isLiked,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(book.title ?? ''),
      subtitle:
          Text(book.authors!.isNotEmpty ? book.authors![0].name ?? '' : ''),
      trailing: Obx(() => IconButton(
            icon: Icon(
              isLiked.value ? Icons.favorite : Icons.favorite_border,
              color: isLiked.value ? Colors.red : null,
            ),
            onPressed: onLike,
          )),
      onTap: () {
        // Get.to(DetailsView(book: book));
      },
    );
  }
}
