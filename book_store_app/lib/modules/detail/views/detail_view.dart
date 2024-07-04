import 'package:book_store_app/modules/likes/controllers/like_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/models/book_model.dart';

class DetailView extends StatelessWidget {
  DetailView({super.key});

  LikeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    final Books book = Get.arguments;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Detail Book'),
        ),
        body: Obx(() {
          return ListView(
            children: [
              SizedBox(
                height: 300,
                child: CachedNetworkImage(
                  imageUrl: book.formats?.imageJpeg ?? '',
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
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
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(book.title ?? ''),
                        Text(
                            'Authors: ${book.authors?.map((e) => e.name).join(', ')}')
                      ],
                    ),
                    IconButton(
                      icon: Icon(
                        controller.isBookLiked(book)
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: controller.isBookLiked(book) ? Colors.red : null,
                      ),
                      onPressed: () {
                        if (controller.isBookLiked(book)) {
                          controller.removeFromLikes(book);
                        } else {
                          controller.addBookToLikes(book);
                        }
                      },
                    )
                  ],
                ),
              )
            ],
          );
        }));
  }
}
