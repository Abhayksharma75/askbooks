import 'dart:convert';

Pdf pdfFromJson(String str) => Pdf.fromJson(json.decode(str));
String pdfToJson(Pdf data) => json.encode(data.toJson());

class Pdf {
  Pdf({
    bool? isAvailable,
    String? acsTokenLink,
  }) {
    _isAvailable = isAvailable;
    _acsTokenLink = acsTokenLink;
  }

  Pdf.fromJson(dynamic json) {
    _isAvailable = json['isAvailable'];
    _acsTokenLink = json['acsTokenLink'];
  }
  bool? _isAvailable;
  String? _acsTokenLink;
  Pdf copyWith({
    bool? isAvailable,
    String? acsTokenLink,
  }) =>
      Pdf(
        isAvailable: isAvailable ?? _isAvailable,
        acsTokenLink: acsTokenLink ?? _acsTokenLink,
      );
  bool? get isAvailable => _isAvailable;
  String? get acsTokenLink => _acsTokenLink;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['isAvailable'] = _isAvailable;
    map['acsTokenLink'] = _acsTokenLink;
    return map;
  }
}
