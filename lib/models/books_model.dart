import 'dart:ffi';

class BookModel {
  final String id;
  final String name;
  final String book_cover;
  final String author;
  final String published_year;
  final String summary;
  final String uploaded_by;
  final String other_img;
  final String price;
  final String datetime;

  BookModel({
    required this.id,
    required this.name,
    required this.book_cover,
    required this.author,
    required this.published_year,
    required this.summary,
    required this.uploaded_by,
    required this.other_img,
    required this.price,
    required this.datetime});

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'book_cover': book_cover,
    'author': author,
    'published_year': published_year,
    'summary' : summary,
    'uploaded_by' : uploaded_by,
    'other_img' : other_img,
    'price' : price,
    'datetime' : datetime,
  };
}