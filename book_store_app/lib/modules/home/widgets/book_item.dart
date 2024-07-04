import 'package:book_store_app/data/models/book_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
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
    return Card(
      child: ListTile(
        leading: SizedBox(
          height: 60,
          width: 60,
          child: CachedNetworkImage(
            imageUrl: book.formats?.imageJpeg ?? '',
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.fitWidth,
                  colorFilter: const ColorFilter.mode(
                    Colors.red,
                    BlendMode.colorBurn,
                  ),
                ),
              ),
            ),
            placeholder: (context, url) =>
            const CupertinoActivityIndicator(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
        title: Text(
          book.title ?? '',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(book.authors!.isNotEmpty
            ? 'Authors: ${book.authors?.map((e) => e.name).join(', ')}' ?? ''
            : ''),
        trailing: Obx(() => IconButton(
          icon: Icon(
            isLiked.value ? Icons.favorite : Icons.favorite_border,
            color: isLiked.value ? Colors.red : null,
          ),
          onPressed: onLike,
        )),
        onTap: () {
          Get.toNamed('/detail', arguments: book);
        },
      ),
    );
  }
}
