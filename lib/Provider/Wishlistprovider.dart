import 'package:askbooks/Models/DetailModel/DetailModel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert'; 
import 'package:flutter/material.dart';

class WishlistProvider with ChangeNotifier {
  List<DetailModel> _wishlist = [];

  List<DetailModel> get wishlist => _wishlist;

  WishlistProvider() {
    _loadWishlist();
  }

  void toggleWishlist(DetailModel book) {
    if (_wishlist.any((item) => item.id == book.id)) {
      _wishlist.removeWhere((item) => item.id == book.id);
    } else {
      _wishlist.add(book);
    }
    _saveWishlist();
    notifyListeners();
  }

  bool isInWishlist(DetailModel book) {
    return _wishlist.any((item) => item.id == book.id);
  }

  Future<void> _loadWishlist() async {
    final prefs = await SharedPreferences.getInstance();
    final wishlistData = prefs.getStringList('wishlist');
    if (wishlistData != null) {
      _wishlist = wishlistData
          .map((bookJson) => DetailModel.fromJson(jsonDecode(bookJson)))
          .toList();
    }
    notifyListeners();
  }

  Future<void> _saveWishlist() async {
    final prefs = await SharedPreferences.getInstance();
    final wishlistJson =
        _wishlist.map((book) => jsonEncode(book.toJson())).toList();
    prefs.setStringList('wishlist', wishlistJson);
  }
}