import 'package:book_store_app/data/models/book_model.dart';
import 'package:flutter/material.dart';

class BookItem extends StatelessWidget {
  final Books book;

  const BookItem({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(book.title ?? ''),
      subtitle:
          Text(book.authors!.isNotEmpty ? book.authors![0].name ?? '' : ''),
      onTap: () {
        // Get.to(DetailsView(book: book));
      },
    );
  }
}
