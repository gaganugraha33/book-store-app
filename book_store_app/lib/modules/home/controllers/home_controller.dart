import 'dart:async';

import 'package:book_store_app/data/models/book_model.dart';
import 'package:book_store_app/data/repositories/book_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/view_state.dart';

class HomeController extends GetxController {
  final BookRepository _bookRepository = BookRepository();
  final ScrollController scrollController = ScrollController();
  final TextEditingController searchController = TextEditingController();
  final FocusNode searchFocusNode = FocusNode();
  final currentPage = 1.obs;
  var books = <Books>[].obs;
  var bookModel = BookModel().obs;
  var viewState = ViewState.loading.obs;
  var error = ''.obs;
  var searchQueryPost = ''.obs;
  var isShowSearch = false.obs;

  Timer? _debounce;

  @override
  void onInit() {
    super.onInit();
    clearData();
    scrollController.addListener(() => _onScroll());
    searchFocusNode.addListener(() => _onSearch());
    fetchBook();
  }

  void fetchBook() async {
    try {
      if (currentPage.value == 1) {
        viewState(ViewState.loading);
      }
      error('');
      bookModel.value = await _bookRepository.getBook(
        qurey: searchQueryPost.value,
        page: currentPage.value,
      );

      if (bookModel.value != null) {
        books.addAll(bookModel.value.results ?? []);
        currentPage.value++;
      }

      if (books.isEmpty) {
        viewState(ViewState.empty);
      } else {
        viewState(ViewState.success);
      }
    } catch (e) {
      error(e.toString());
      viewState(ViewState.error);
    }
  }

  void updateSearchQuery(String newQuery) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () async {
      if (newQuery.isNotEmpty && searchQueryPost.value != newQuery) {
        searchQueryPost.value = newQuery;
        currentPage.value = 1;
        books.clear();
        fetchBook();
      } else {
        currentPage.value = 1;
        books.clear();
        isShowSearch(false);
        fetchBook();
        FocusManager.instance.primaryFocus?.unfocus();
      }
    });
  }

  void clearData() {
    currentPage.value = 1;
    searchController.clear();
    searchQueryPost('');
    isShowSearch(false);
    searchFocusNode.unfocus();
    books.clear();
  }

  Future<void> _onSearch() async {
    if (searchFocusNode.hasFocus ||
        (searchController.text.isNotEmpty && !searchFocusNode.hasFocus)) {
      isShowSearch(true);
    } else {
      isShowSearch(false);
      searchQueryPost('');
    }
  }

  Future<void> _onScroll() async {
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.position.pixels;

    if (books.length != bookModel.value.count) {
      if (maxScroll == currentScroll) {
        fetchBook();
      }
    }
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}
