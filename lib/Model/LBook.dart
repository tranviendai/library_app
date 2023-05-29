import 'package:library_app/Model/Book.dart';

class LBook {
    String bookId;
    Book? books;
    LBook({
        required this.bookId,
        this.books,
    });

    factory LBook.fromJson(Map<String, dynamic> json) => LBook(
        bookId: json["bookID"],
        books: json["books"] == null ? null : Book.fromJson(json["books"]),
    );

    Map<String, dynamic> toJson() => {
        "bookID": bookId,
        "books": books?.toJson(),
    };
}
