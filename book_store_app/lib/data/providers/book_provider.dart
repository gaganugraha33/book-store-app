import 'dart:developer';

import 'package:dio/dio.dart';

import '../models/book_model.dart';
import 'dio_client.dart';

class BookProvider {
  final DioClient _dioClient;

  BookProvider() : _dioClient = DioClient();

  Future<BookModel> fetchBook({String query = '', int page = 0}) async {
    try {
      final response = await _dioClient.dio.get('/books', queryParameters: {
        'search': query,
        'page': page,
      });
      if (response.statusCode == 200) {
        final book = response.data;
        return BookModel.fromJson(book);
      } else {
        throw Exception('Failed to load books');
      }
    } on DioException catch (e) {
      log(e.toString());
      throw Exception('Failed to load books');
    }
  }
}
