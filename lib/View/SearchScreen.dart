import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:library_app/Model/Drawer.dart' as drawer;
import 'package:library_app/Model/LibraryCard.dart';
import 'package:library_app/Services/remote_service.dart';
import 'package:library_app/View/DetailLibraryCard.dart';
import 'package:library_app/View/Home.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => CardSearch();
}

class CardSearch extends State<SearchScreen> {
  final TextEditingController _searchController = new TextEditingController();
  List<LibraryCard>? card;
  bool checkSearch = true;
  List<int> itemCard = [];
  bool isload = false;
  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    card = await RemoteService().getLibraryCard();
    if (card != null) {
      setState(() {
        isload = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!isload) {
      return Center(child: CircularProgressIndicator());
    } else {
      return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue,
            title: const Text('Tra Cứu'),
          ),
          drawer: const drawer.NavigationDrawer(),
          body: SingleChildScrollView(
              child: Container(
            margin: EdgeInsets.all(10),
            child: Column(
              children: [
                TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                      fillColor: Colors.white54,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 1),
                          borderRadius: BorderRadius.circular(10)),
                      enabledBorder:
                          OutlineInputBorder(borderSide: BorderSide(width: 0.4)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      labelText: "Mã Số Sinh Viên",
                      labelStyle: TextStyle(color: Colors.black),
                      prefixIcon: Icon(Icons.search, color: Colors.black),
                      suffixIcon: IconButton(
              icon: Icon(Icons.clear, color: Colors.black),
              onPressed: () {
                _searchController.clear();
              }),),
                      
                ),
                Row(children: [
                  Expanded(
                      child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              itemCard = [];
                              checkSearch = false;
                              for (int i = 0; i < card!.length; i++) {
                                if (card![i]
                                    .libraryCardId!
                                    .contains(_searchController.text)) {
                                  if (_searchController.text.length == 5) {
                                    itemCard.add(i);
                                  }
                                }
                              }
                            });
                          },
                          child: Container(
                            child: Text("Tra cứu"),
                          )))
                ]),
                Container(
                  height: 50,
                  child: Center(
                    child: Text(
                      "Kết Quả Tìm Kiếm",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                checkSearch ? 
                Container(child: Text("Hiện tại chưa có kết quả nào"),) 
                :  itemCard.isNotEmpty ? Container(
                  child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: itemCard.length,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        index = itemCard[index];
                        return searchItem(context, index);
                      }),
                ) : Container(child: Text("Vui lòng nhập mã sinh viên của bạn"),) 
              ],
            ),
          )));
    }
  }

  Widget searchItem(BuildContext context, int index) {
    var cards = card![index];
    return Center(
      child: Container(
        alignment: Alignment.centerLeft,
        child: Column(children: [
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
                    richText("Mã Số Sinh Viên: ", cards.libraryCardId.toString()),
                    richText("Họ Tên: ", cards.fullName.toString()),
                    richText("Ngày Lập Thẻ: ", cards.startDate.toString()),
                    richText("Hạn Thẻ: ", cards.expirationDate.toString()),
                    richText("Tình Trạng: ",
                        cards.cardStatus != "Yes" ? "Đang Sử Dụng" : "Hết Hạn"),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                   ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red
                    ),
                  child: Text("Xem Chi Tiết"),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => MyDetails(card: cards)));
                  },
                ),
                 ],)
                  ],
                ),
              ),
              
            ),
          ]),
        ]),
      ),
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
