// import 'package:cloud_firestore/cloud_firestore.dart';
//
// import '../models/books_model.dart';
//
//
//
// class BookRepo {
//   CollectionReference books = FirebaseFirestore.instance.collection('books');
//
//   @override
//   Future<List<books>> getAll() async {
//   var items = await books.list();
//   return items.map((item) => Book.fromMap(item)).toList();
//   }
//
//   @override
//   Future<Book?> getOne(int id) async {
//   var item = await _db.findOne(id);
//   return item != null ? Book.fromMap(item) : null;
//   }
//
//   @override
//   Future<void> insert(Book book) async {
//   await _db.insert(book.toMap());
//   }
//
//   @override
//   Future<void> update(Book book) async {
//   await _db.update(book.toMap());
//   }
//
//   @override
//   Future<void> delete(int id) async {
//   await _db.remove(id);
//   }
//
// }

