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
                        fit: BoxFit.fill,
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
                    Expanded(
                      child: Text(
                        book.title ?? '',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
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
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        'Authors: ${book.authors?.map((e) => e.name).join(', ')}'),
                    const SizedBox(height: 5,),
                    Text(
                        'Languages: ${book.languages?.map((e) => e).join(', ')}'),
                    const SizedBox(height: 5,),
                    Text(
                        'Bookshelves: ${book.bookshelves?.map((e) => e).join(', ')}'),
                    const SizedBox(height: 5,),
                    Text(
                        'Subjects: ${book.subjects?.map((e) => e).join(', ')}'),
                  ],
                ),
              )
            ],
          );
        }));
  }
}
