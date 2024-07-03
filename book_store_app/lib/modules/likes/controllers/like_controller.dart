import 'package:book_store_app/utils/constants.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../../data/models/book_model.dart';
import '../../../utils/view_state.dart';

class LikeController extends GetxController {
  var likeBooks = <Books?>[].obs;
  var viewState = ViewState.loading.obs;
  var error = ''.obs;

  @override
  void onInit() {
    loadLikedBooks();
    super.onInit();
  }

  Map<String, dynamic> convertDynamicMapToStringMap(
      Map<dynamic, dynamic> dynamicMap) {
    return dynamicMap.map((key, value) {
      if (value is Map) {
        return MapEntry(key.toString(), convertDynamicMapToStringMap(value));
      } else if (value is List) {
        return MapEntry(
            key.toString(),
            value.map((item) {
              if (item is Map) {
                return convertDynamicMapToStringMap(item);
              }
              return item;
            }).toList());
      }
      return MapEntry(key.toString(), value);
    });
  }

  void loadLikedBooks() {
    try {
      viewState(ViewState.loading);
      error('');
      var box = Hive.box(AppStrings.likedBooks);
      var books = box.values
          .map((e) => Books.fromJson(
              convertDynamicMapToStringMap(Map<String, dynamic>.from(e))))
          .toList();
      likeBooks.assignAll(books);
      if (likeBooks.isEmpty) {
        viewState(ViewState.empty);
      } else {
        viewState(ViewState.success);
      }
    } catch (e) {
      error(e.toString());
      viewState(ViewState.error);
    }
  }

  void addBookToLikes(Books books) {
    var box = Hive.box(AppStrings.likedBooks);
    box.put(books.id, books.toJson());
    likeBooks.add(books);
  }

  void removeFromLikes(Books books) {
    var box = Hive.box(AppStrings.likedBooks);
    box.delete(books.id);
    likeBooks.removeWhere((element) => element?.id == books.id);
  }

  bool isBookLiked(Books books) {
    return likeBooks.any((element) => element?.id == books.id);
  }
}
