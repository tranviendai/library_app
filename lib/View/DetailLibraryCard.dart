import 'package:flutter/material.dart';
import 'package:library_app/Model/Book.dart';
import 'package:library_app/Model/Category.dart';
import 'package:library_app/Model/LibraryCard.dart';
import 'package:library_app/View/SearchScreen.dart' as SearchScreen;
import 'package:readmore/readmore.dart';

class MyApp extends StatelessWidget {
  final LibraryCard card;
  const MyApp({super.key, required this.card});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Library',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyDetails(card: card));
  }
}

class MyDetails extends StatefulWidget {
  const MyDetails({super.key, required this.card});
  final LibraryCard card;

  @override
  State<MyDetails> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(widget.card.fullName.toString()),
      ),
      body: SingleChildScrollView(
          child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Row(children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        richText("Mã Số Sinh Viên: ",
                            widget.card.libraryCardId.toString()),
                        richText("Họ Tên: ", widget.card.fullName.toString()),
                        richText(
                            "Ngày Lập Thẻ: ", widget.card.startDate.toString()),
                        richText(
                            "Hạn Thẻ: ", widget.card.expirationDate.toString()),
                        richText(
                            "Tình Trạng: ",
                            widget.card.cardStatus != "Yes"
                                ? "Đang Sử Dụng"
                                : "Hết Hạn")
                      ]),
                ),
              ),
            ]),
            SizedBox(
              height: 20,
            ),
            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: widget.card.callCards!.length,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final callcard = widget.card.callCards![index];
                  return Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white),
                    margin: EdgeInsets.only(top: 5, bottom: 5),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                              "https://picsum.photos/seed/${callcard.lBook.books!.bookId}/100/100"),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.amber),
                                  child: Text(callcard.endDate != null
                                      ? "Đã Trả"
                                      : "Chưa Trả")),
                              Text("Sách: " + callcard.lBook.books!.title),
                              Text("Ngày Mượn: " + callcard.startDate),
                              Text("Hạn Trả: " + callcard.deadline),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                })
          ],
        ),
      )),
    );
  }
}

Widget richText(String label, String value) {
  return RichText(
      text: TextSpan(children: [
    TextSpan(text: label, style: TextStyle(fontWeight: FontWeight.bold)),
    TextSpan(text: value)
  ], style: TextStyle(fontSize: 20, color: Colors.black)));
}
