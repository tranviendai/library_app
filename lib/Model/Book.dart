// To parse this JSON data, do
//
//     final book = bookFromJson(jsonString);

import 'dart:convert';

List<Book> bookFromJson(String str) => List<Book>.from(json.decode(str).map((x) => Book.fromJson(x)));

String bookToJson(List<Book> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Book {
    Book({
        required this.bookId,
        required this.bookIndex,
        required this.title,
        required this.author,
        required this.image,
        required this.publisher,
        required this.publishingYear,
        required this.summary,
        required this.count,
        required this.addDate,
        required this.categoryId,
        required this.lBooks,
    });

    String bookId;
    int bookIndex;
    String title;
    String author;
    String image;
    String publisher;
    String publishingYear;
    String summary;
    int count;
    String addDate;
    int categoryId;
    List<dynamic> lBooks;

    factory Book.fromJson(Map<String, dynamic> json) => Book(
        bookId: json["bookID"],
        bookIndex: json["bookIndex"],
        title: json["title"],
        author: json["author"],
        image: json["image"],
        publisher: json["publisher"],
        publishingYear: json["publishingYear"],
        summary: json["summary"],
        count: json["count"],
        addDate: json["addDate"],
        categoryId: json["categoryID"],
        lBooks: List<dynamic>.from(json["lBooks"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "bookID": bookId,
        "bookIndex": bookIndex,
        "title": title,
        "author": author,
        "image": image,
        "publisher": publisher,
        "publishingYear": publishingYear,
        "summary": summary,
        "count": count,
        "addDate": addDate,
        "categoryID": categoryId,
        "lBooks": List<dynamic>.from(lBooks.map((x) => x)),
    };
}
