// To parse this JSON data, do
//
//     final libraryCard = libraryCardFromJson(jsonString);

import 'dart:convert';

List<LibraryCard> libraryCardFromJson(String str) => List<LibraryCard>.from(json.decode(str).map((x) => LibraryCard.fromJson(x)));

String libraryCardToJson(List<LibraryCard> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LibraryCard {
    String? libraryCardId;
    int? librayCardIndex;
    String? fullName;
    CardStatus? cardStatus;
    String? startDate;
    String? expirationDate;
    List<CallCard>? callCards;

    LibraryCard({
        this.libraryCardId,
        this.librayCardIndex,
        this.fullName,
        this.cardStatus,
        this.startDate,
        this.expirationDate,
        this.callCards,
    });

    factory LibraryCard.fromJson(Map<String, dynamic> json) => LibraryCard(
        libraryCardId: json["libraryCardID"],
        librayCardIndex: json["librayCardIndex"],
        fullName: json["fullName"],
        cardStatus: cardStatusValues.map[json["cardStatus"]]!,
        startDate: json["startDate"],
        expirationDate: json["expirationDate"],
        callCards: json["callCards"] == null ? [] : List<CallCard>.from(json["callCards"]!.map((x) => CallCard.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "libraryCardID": libraryCardId,
        "librayCardIndex": librayCardIndex,
        "fullName": fullName,
        "cardStatus": cardStatusValues.reverse[cardStatus],
        "startDate": startDate,
        "expirationDate": expirationDate,
        "callCards": callCards == null ? [] : List<dynamic>.from(callCards!.map((x) => x.toJson())),
    };
}

class CallCard {
    String callCardId;
    int callCardIndex;
    String startDate;
    String deadline;
    String? endDate;
    BookStatus bookStatus;
    String libraryCardId;
    dynamic libaryCard;
    String lBookId;
    LBook lBook;

    CallCard({
        required this.callCardId,
        required this.callCardIndex,
        required this.startDate,
        required this.deadline,
        this.endDate,
        required this.bookStatus,
        required this.libraryCardId,
        this.libaryCard,
        required this.lBookId,
        required this.lBook,
    });

    factory CallCard.fromJson(Map<String, dynamic> json) => CallCard(
        callCardId: json["callCardID"],
        callCardIndex: json["callCardIndex"],
        startDate: json["startDate"],
        deadline: json["deadline"],
        endDate: json["endDate"],
        bookStatus: bookStatusValues.map[json["bookStatus"]]!,
        libraryCardId: json["libraryCardID"],
        libaryCard: json["libaryCard"],
        lBookId: json["lBookID"],
        lBook: LBook.fromJson(json["lBook"]),
    );

    Map<String, dynamic> toJson() => {
        "callCardID": callCardId,
        "callCardIndex": callCardIndex,
        "startDate": startDate,
        "deadline": deadline,
        "endDate": endDate,
        "bookStatus": bookStatusValues.reverse[bookStatus],
        "libraryCardID": libraryCardId,
        "libaryCard": libaryCard,
        "lBookID": lBookId,
        "lBook": lBook.toJson(),
    };
}

enum BookStatus { NGUYN_VN, SCH_HNG, MT_SCH }

final bookStatusValues = EnumValues({
    "Mất sách": BookStatus.MT_SCH,
    "Nguyên vẹn": BookStatus.NGUYN_VN,
    "Sách hỏng": BookStatus.SCH_HNG
});

class Books {
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
    dynamic category;
    List<LBook?> lBooks;

    Books({
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
        this.category,
        required this.lBooks,
    });

    factory Books.fromJson(Map<String, dynamic> json) => Books(
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
        category: json["category"],
        lBooks: List<LBook?>.from(json["lBooks"].map((x) => x == null ? null : LBook.fromJson(x))),
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
        "category": category,
        "lBooks": List<dynamic>.from(lBooks.map((x) => x?.toJson())),
    };
}

class LBook {
    String lBookId;
    int lBookIndex;
    Status status;
    String note;
    String bookId;
    Books? books;

    LBook({
        required this.lBookId,
        required this.lBookIndex,
        required this.status,
        required this.note,
        required this.bookId,
        this.books,
    });

    factory LBook.fromJson(Map<String, dynamic> json) => LBook(
        lBookId: json["lBookID"],
        lBookIndex: json["lBookIndex"],
        status: statusValues.map[json["status"]]!,
        note: json["note"],
        bookId: json["bookID"],
        books: json["books"] == null ? null : Books.fromJson(json["books"]),
    );

    Map<String, dynamic> toJson() => {
        "lBookID": lBookId,
        "lBookIndex": lBookIndex,
        "status": statusValues.reverse[status],
        "note": note,
        "bookID": bookId,
        "books": books?.toJson(),
    };
}

enum Status { ANG_MN, CN_SCH, SCH_HNG, SCH_MT }

final statusValues = EnumValues({
    "Đang mượn": Status.ANG_MN,
    "Còn sách": Status.CN_SCH,
    "Sách hỏng": Status.SCH_HNG,
    "Sách mất": Status.SCH_MT
});

enum CardStatus { YES, NO }

final cardStatusValues = EnumValues({
    "No": CardStatus.NO,
    "Yes": CardStatus.YES
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
