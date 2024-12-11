
import 'package:http/http.dart' as http;

class BooksApi {

  String baseurl = "https://www.googleapis.com/books/v1";
  Future getBooks() async {
    final response = await http.get(
      Uri.parse(
          "$baseurl/volumes?q=Fiction&maxResults=40"),
    );

    var body = response.body;
    return body;
  }

  Future searchBooks({required String searchBook}) async {
    final response = await http.get(
      Uri.parse("$baseurl/volumes?q=$searchBook&maxResults=39"),
    );
    var body = response.body;
    return body;
  }

  Future showBooksDetails({required String id}) async {
    final response = await http.get(
      Uri.parse("$baseurl/volumes/$id"),
    );

    var body = response.body;
    return body;
  }

  Future getBooks2() async {
    final response = await http.get(
      Uri.parse(
          "$baseurl/volumes?q=amine+manga&maxResults=39"),
    );

    var body = response.body;
    return body;
  }

  Future getBooks3() async {
    final response = await http.get(
      Uri.parse(
          "$baseurl/volumes?q=action+adventure&maxResults=39"),
    );

    var body = response.body;
    return body;
  }

  Future getBooks4() async {
    final response = await http.get(
      Uri.parse(
          "$baseurl/volumes?q=novel&maxResults=39"),
    );

    var body = response.body;
    return body;
  }

  Future getBooks5() async {
    final response = await http.get(
      Uri.parse(
          "$baseurl/volumes?q=horroe&maxResults=39"),
    );

    var body = response.body;
    return body;
  }
}
