import 'package:book_store_app/data/providers/book_provider.dart';

import '../models/book_model.dart';

class BookRepository {
  final BookProvider _bookProvider = BookProvider();

  Future<BookModel> getBook({
    String qurey = '',
    int page = 0,
  }) {
    return _bookProvider.fetchBook(query: qurey, page: page);
  }
}
