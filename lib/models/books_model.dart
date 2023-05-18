import 'dart:ffi';

class BooksModel {
  final String name;
  final String book_cover;
  final String author;
  final String published_year;
  final String summary;
  final String uploaded_by;
  final String other_img;
  final String price;

  BooksModel(this.name,
      this.book_cover,
      this.author,
      this.published_year,
      this.summary,
      this.uploaded_by,
      this.other_img,
      this.price);
}