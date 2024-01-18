import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Models/BookModel.dart';
import '../../Widgets/AddBookDialog.dart';

class HomeScreenController extends GetxController {
  List<Book> books = [];

  @override
  void onInit() {
    super.onInit();
    fetchBooksFromFirestore();
  }

  void fetchBooksFromFirestore() async {
    try {
      final CollectionReference booksCollection =
          FirebaseFirestore.instance.collection('Books');
      QuerySnapshot<Map<String, dynamic>> snapshot =
          await booksCollection.get() as QuerySnapshot<Map<String, dynamic>>;
      List<Book> fetchedBooks =
          snapshot.docs.map((QueryDocumentSnapshot<Map<String, dynamic>> doc) {
        Map<String, dynamic>? data = doc.data();
        print(data);
        return Book.fromFirestore(data);
      }).toList();
      books = fetchedBooks;
      update();
    } catch (e) {
      print('Error fetching books: $e');
    }
  }

  void addBookToFirestore(Book newBook) async {
    try {
      final CollectionReference booksCollection =
          FirebaseFirestore.instance.collection('Books');
      await booksCollection.add({
        'Name': newBook.name,
        'Author': newBook.author,
        'Genre': newBook.genre,
        'ImageLink': newBook.imagelink!,
      });
      fetchBooksFromFirestore();
    } catch (e) {
      print('Error adding book: $e');
    }
  }

  void showBookDetailsDialog(BuildContext context, Book book) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.black,
          elevation: 50,
          shape: const Border.fromBorderSide(
            BorderSide(color: Color.fromARGB(255, 28, 195, 178)),
          ),
          title: Text(
            'Book Details: ',
            style: GoogleFonts.novaSquare(color: Colors.white, fontSize: 20),
          ),
          contentPadding: const EdgeInsets.all(15),
          content: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Name: ${book.name}',
                    style: GoogleFonts.novaSquare(
                        color: Colors.white, fontSize: 15),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Author: ${book.author}',
                    style: GoogleFonts.novaSquare(
                        color: Colors.white, fontSize: 15),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Genre: ${book.genre}',
                    style: GoogleFonts.novaSquare(
                        color: Colors.white, fontSize: 15),
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Close',
                style:
                    GoogleFonts.novaSquare(color: Colors.white, fontSize: 20),
              ),
            ),
          ],
        );
      },
    );
  }

  void showAddBookDialog(
      BuildContext context, HomeScreenController controller) {
    TextEditingController nameController = TextEditingController();
    TextEditingController authorController = TextEditingController();
    TextEditingController genreController = TextEditingController();
    TextEditingController imageLinkController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomAlertDialog(
          nameController: nameController,
          authorController: authorController,
          genreController: genreController,
          imageLinkController: imageLinkController,
          onCancel: () {
            Navigator.of(context).pop();
          },
          onAdd: () {
            String bookName = nameController.text.trim();
            String authorName = authorController.text.trim();
            String genreName = genreController.text.trim();
            String imageLinkref = imageLinkController.text.trim();

            if (bookName.isNotEmpty &&
                authorName.isNotEmpty &&
                genreName.isNotEmpty) {
              controller.addBookToFirestore(
                Book(
                    name: bookName,
                    author: authorName,
                    genre: genreName,
                    imagelink: imageLinkref),
              );
              Navigator.of(context).pop();
            } else {
              Get.snackbar('Add book failed', 'All fields should be filled',
                  backgroundColor: Colors.white);
            }
          },
        );
      },
    );
  }
}
