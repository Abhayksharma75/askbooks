import 'dart:convert';

import 'package:askbooks/Models/DetailModel/DetailModel.dart';
import 'package:askbooks/Models/Model/Books.dart';
import 'package:askbooks/Models/Repository/booksApi.dart';
import 'package:flutter/cupertino.dart';

class ApiNotifier extends ChangeNotifier {
  final BooksApi bookApi = BooksApi();
  Future<Books> getBookData() async {
    var res = await bookApi.getBooks();
    var data = jsonDecode(res);

    return Books.fromJson(data);
  }

  Future<Books> getBookData2() async {
    var res = await bookApi.getBooks2();
    var data = jsonDecode(res);

    return Books.fromJson(data);
  }

  Future<Books> getBookData3() async {
    var res = await bookApi.getBooks3();
    var data = jsonDecode(res);

    return Books.fromJson(data);
  }

  Future<Books> getBookData4() async {
    var res = await bookApi.getBooks4();
    var data = jsonDecode(res);

    return Books.fromJson(data);
  }

  Future<Books> getBookData5() async {
    var res = await bookApi.getBooks5();
    var data = jsonDecode(res);

    return Books.fromJson(data);
  }
  Future<Books> searchBookData({required String searchBook}) async {
    var res = await bookApi.searchBooks(searchBook: searchBook);
    var data = jsonDecode(res);

    return Books.fromJson(data);
  }
  Future<DetailModel> showBookData({required String id}) async {
    var res = await bookApi.showBooksDetails(id: id);
    var data = jsonDecode(res);

    return DetailModel.fromJson(data);
  }
  
}