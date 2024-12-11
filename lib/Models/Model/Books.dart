import 'dart:convert';

import 'package:askbooks/Models/Model/Items.dart';

Books booksFromJson(String str) => Books.fromJson(json.decode(str));
String booksToJson(Books data) => json.encode(data.toJson());

class Books {
  Books({
    String? kind,
    int? totalItems,
    List<Items>? items,
  }) {
    _kind = kind;
    _totalItems = totalItems;
    _items = items;
  }

  Books.fromJson(dynamic json) {
    _kind = json['kind'];
    _totalItems = json['totalItems'];
    if (json['items'] != null) {
      _items = [];
      json['items'].forEach((v) {
        _items?.add(Items.fromJson(v));
      });
    }
  }
  String? _kind;
  int? _totalItems;
  List<Items>? _items;
  Books copyWith({
    String? kind,
    int? totalItems,
    List<Items>? items,
  }) => Books(
        kind: kind ?? _kind,
        totalItems: totalItems ?? _totalItems,
        items: items ?? _items,
      );
  String? get kind => _kind;
  int? get totalItems => _totalItems;
  List<Items>? get items => _items;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['kind'] = _kind;
    map['totalItems'] = _totalItems;
    if (_items != null) {
      map['items'] = _items?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
