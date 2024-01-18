import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAlertDialog extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController authorController;
  final TextEditingController genreController;
  final TextEditingController imageLinkController;
  final Function() onCancel;
  final Function() onAdd;

  const CustomAlertDialog({
    super.key,
    required this.nameController,
    required this.authorController,
    required this.genreController,
    required this.imageLinkController,
    required this.onCancel,
    required this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.black,
      elevation: 50,
      shape: const RoundedRectangleBorder(
        side: BorderSide(color: Color.fromARGB(255, 28, 195, 178)),
        borderRadius: BorderRadius.all(Radius.circular(25)),
      ),
      title: Text(
        'Add New Book',
        style: GoogleFonts.novaSquare(color: Colors.white, fontSize: 20),
      ),
      contentPadding: const EdgeInsets.all(15),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 15),
            TextField(
              controller: nameController,
              cursorColor: Colors.white,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'Book Name',
                enabledBorder: const OutlineInputBorder(
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(25)),
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 28, 195, 178)),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 28, 195, 178)),
                ),
                labelStyle:
                    GoogleFonts.novaSquare(color: Colors.white, fontSize: 15),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: authorController,
              cursorColor: Colors.white,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'Author Name',
                enabledBorder: const OutlineInputBorder(
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(25)),
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 28, 195, 178)),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 28, 195, 178)),
                ),
                labelStyle:
                    GoogleFonts.novaSquare(color: Colors.white, fontSize: 15),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: genreController,
              cursorColor: Colors.white,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'Genre',
                enabledBorder: const OutlineInputBorder(
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(25)),
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 28, 195, 178)),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 28, 195, 178)),
                ),
                labelStyle:
                    GoogleFonts.novaSquare(color: Colors.white, fontSize: 15),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: imageLinkController,
              cursorColor: Colors.white,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'ImageLink',
                enabledBorder: const OutlineInputBorder(
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(25)),
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 28, 195, 178)),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 28, 195, 178)),
                ),
                labelStyle:
                    GoogleFonts.novaSquare(color: Colors.white, fontSize: 15),
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: onCancel,
          child: Text(
            'Cancel',
            style: GoogleFonts.novaSquare(color: Colors.white, fontSize: 15),
          ),
        ),
        TextButton(
          onPressed: onAdd,
          child: Text(
            'Add',
            style: GoogleFonts.novaSquare(color: Colors.white, fontSize: 15),
          ),
        ),
      ],
    );
  }
}
