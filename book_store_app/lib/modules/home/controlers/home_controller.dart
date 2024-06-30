import 'package:book_store_app/data/models/book_model.dart';
import 'package:book_store_app/data/repositories/book_repository.dart';
import 'package:get/get.dart';

import '../../../utils/view_state.dart';

class HomeController extends GetxController {
  final BookRepository _bookRepository = BookRepository();
  var books = <Books>[].obs;
  var viewState = ViewState.loading.obs;
  var error = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchBook();
  }

  void fetchBook() async {
    try {
      viewState(ViewState.loading);
      error('');
      var fetchedBooks = await _bookRepository.getBook(qurey: '');
      books.assignAll(fetchedBooks.results ?? []);
      viewState(ViewState.success);
    } catch (e) {
      error(e.toString());
      viewState(ViewState.error);
    }
  }
}
