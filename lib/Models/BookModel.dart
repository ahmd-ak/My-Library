class Book {
  final String name;
  final String author;
  final String genre;
  String? imagelink;

  Book({
    required this.name,
    required this.author,
    required this.genre,
    this.imagelink,
  });

  factory Book.fromFirestore(Map<String, dynamic> data) {
    return Book(
        name: data['Name'],
        author: data['Author'],
        genre: data['Genre'],
        imagelink: data['ImageLink']!);
  }
}
