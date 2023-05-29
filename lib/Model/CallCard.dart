
import 'package:library_app/Model/LBook.dart';

class CallCard {
    String callCardId;
    String startDate;
    String deadline;
    String endDate;
    String libraryCardId;
    dynamic libaryCard;
    String lBookId;
    LBook lBook;

    CallCard({
        required this.callCardId,
        required this.startDate,
        required this.deadline,
        required this.endDate,
        required this.libraryCardId,
        this.libaryCard,
        required this.lBookId,
        required this.lBook,
    });

    factory CallCard.fromJson(Map<String, dynamic> json) => CallCard(
        callCardId: json["callCardID"],
        startDate: json["startDate"],
        deadline: json["deadline"],
        endDate: json["endDate"],
        libraryCardId: json["libraryCardID"],
        libaryCard: json["libaryCard"],
        lBookId: json["lBookID"],
        lBook: LBook.fromJson(json["lBook"]),
    );

    Map<String, dynamic> toJson() => {
        "callCardID": callCardId,
        "startDate": startDate,
        "deadline": deadline,
        "endDate": endDate,
        "libraryCardID": libraryCardId,
        "libaryCard": libaryCard,
        "lBookID": lBookId,
        "lBook": lBook.toJson(),
    };
}
