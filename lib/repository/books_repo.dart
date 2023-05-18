import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/books_model.dart';

CollectionReference books = FirebaseFirestore.instance.collection('books');

class BooksRepo {

  Future<void> addBook() async {

    //final BaseApiService _apiService = NetworkApiService();

    @override
    Future<BooksModel?> getBookData() async {
      //
      }
    }
}

