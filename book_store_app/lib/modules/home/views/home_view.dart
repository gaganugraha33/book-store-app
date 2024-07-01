import 'package:book_store_app/modules/home/controllers/home_controller.dart';
import 'package:book_store_app/modules/home/widgets/book_item.dart';
import 'package:flutter/cupertino.dart';
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
      appBar: AppBar(title: Obx(() {
        return Column(
          children: [
            const Text(AppStrings.appName),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextFormField(
                decoration: InputDecoration(
                  suffixIcon: Visibility(
                    visible: controller.searchQueryPost.value.isNotEmpty,
                    child: IconButton(
                        key: const Key('clear_button'),
                        icon: (Icon(
                          Icons.clear,
                          color: Colors.grey[700],
                          size: 20,
                        )),
                        onPressed: () {
                          controller.currentPage.value = 1;
                          controller.searchController.clear();
                          controller.searchQueryPost('');
                          controller.isShowSearch(false);
                          controller.searchFocusNode.unfocus();
                          controller.books.clear();
                          controller.fetchBook();
                        }),
                  ),
                  hintText: AppStrings.inputKeyword,
                  prefixIcon: const Icon(
                    Icons.search,
                    size: 20,
                  ),
                ),
                focusNode: controller.searchFocusNode,
                maxLines: 1,
                maxLength: 18,
                controller: controller.searchController,
                keyboardType: TextInputType.text,
                onChanged: (value) {
                  controller.updateSearchQuery(value);
                },
              ),
            ),
          ],
        );
      })),
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
              controller: controller.scrollController,
              itemCount:
                  controller.bookModel.value.count == controller.books.length
                      ? controller.books.length
                      : controller.books.length + 1,
              itemBuilder: (context, index) {
                return index >= controller.books.length
                    ? const Padding(
                        padding: EdgeInsets.only(
                          top: 20.0,
                          bottom: 20.0,
                        ),
                        child: Column(
                          children: <Widget>[
                            CupertinoActivityIndicator(),
                            SizedBox(height: 5.0),
                            Text(AppStrings.loadMoreInfo),
                          ],
                        ),
                      )
                    : BookItem(book: controller.books[index]);
              },
            );
          default:
            return Container();
        }
      }),
    );
  }
}
