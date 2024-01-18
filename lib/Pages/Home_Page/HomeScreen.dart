import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'HomePageController.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenController>(
      init: HomeScreenController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 28, 195, 178),
            title: Text(
              'Books List',
              style: GoogleFonts.novaSquare(color: Colors.white, fontSize: 25),
            ),
            centerTitle: true,
            elevation: 0,
          ),
          backgroundColor: Colors.black,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: ListView(
              children: controller.books.map(
                (book) {
                  return Container(
                    padding: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                        border: Border.symmetric(
                            horizontal: BorderSide(color: Colors.white))),
                    child: ListTile(
                      leading: book.imagelink != ""
                          ? Image(image: NetworkImage(book.imagelink!))
                          : null,
                      title: Text(
                        book.name,
                        style: GoogleFonts.novaSquare(
                            color: Colors.white, fontSize: 15),
                      ),
                      textColor: Colors.white,
                      onTap: () =>
                          controller.showBookDetailsDialog(context, book),
                    ),
                  );
                },
              ).toList(),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: const Color.fromARGB(255, 28, 195, 178),
            onPressed: () => controller.showAddBookDialog(context, controller),
            tooltip: 'Add Book',
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }
}
