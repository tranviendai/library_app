import 'package:flutter/material.dart';
import 'package:library_app/Model/Book.dart';
import 'package:library_app/Services/remote_service.dart';
import 'package:library_app/View/AllBook.dart';
import 'package:library_app/View/DetailBook.dart';
import 'package:library_app/Model/Category.dart';
import 'package:readmore/readmore.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {
  static List<Book>? book;
  static List<Category>? category;
  static bool sort = false;
  var selectItemCategory = 1;
  static var isLoad = false;
  List<int> listCategory = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    book = await RemoteService().getBooks();
    category = await RemoteService().getCategory();
    if (book != null && category != null) {
      setState(() {
        isLoad = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!isLoad) {
      return const Center(child: CircularProgressIndicator());
    } else {
      return Container(
        child: SingleChildScrollView(
          child: SizedBox(
              child: Column(
            children: [
             
              Container(
                  padding: EdgeInsets.all(10),
                  alignment: Alignment.topLeft,
                  child: Row(
                    children: [
                     const Text(
                        "Thể Loại: ",
                        style: TextStyle(fontSize: 24, color: Colors.black),
                      ),
                      SizedBox(
                        width: 200,
                        child: DropdownButtonFormField(
                            decoration: InputDecoration(
                                disabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: const BorderSide(
                                        width: 1, color: Colors.blueAccent)),
                                border: OutlineInputBorder(
                                    borderRadius:  BorderRadius.circular(20),
                                    borderSide: const BorderSide(
                                        width: 1, color: Colors.blueAccent)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: const BorderSide(
                                        width: 1, color: Colors.blueAccent))),
                            value: 1,
                            items: category!.map((location) {
                              return DropdownMenuItem(
                                value: location.categoryId,
                                child:  Text(
                                  location.nameCategory,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                  ),
                                ),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                selectItemCategory = value!;
                              });
                            }),
                      ),
                    ],
                  )),
              SizedBox(
                height: 250,
                child: ListCategory(selectItemCategory.toString()),
              ),
              Container(
                alignment: Alignment.bottomRight,
                padding: EdgeInsets.only(right: 20,bottom: 5),
                child: TextButton(
                  onPressed: (){Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => AllBook(), fullscreenDialog: false),);},
                  child: Text("Xem Tất Cả", style: TextStyle(color: Colors.black,fontSize: 24),),
                ),
              ),
               SizedBox(
                height: 400,
                child: ListBook(),
              ),
            ],
          )),
        ),
      );
    }
  }

  Widget ListBook() {
    return GridView.builder(
        itemCount: book!.length,
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.all(3),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 1/1.25),
        itemBuilder: (context, index) {
          final sortBooks = book
            ?..sort((item1, item2) => sort
                ? item1.title.toLowerCase().compareTo(item2.title.toLowerCase())
                : item2.title
                    .toLowerCase()
                    .compareTo(item1.title.toLowerCase()));
          final books = book![index];
          return InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => MyDetails(book: book![index])));
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                margin: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).cardColor,
                ),
                child: Column(children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image(
                      image: NetworkImage(book![index].image),
                      height: 170,
                      width: 170,
                      fit: BoxFit.fill,
                    ),
                  ),
                  const Padding(padding: EdgeInsets.all(2)),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: ReadMoreText(
                      trimLength: 16,
                      trimCollapsedText: '...',
                      trimExpandedText: '...',
                      book![index].title,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                    ),
                  )
                ]),
              ));
        });
  }

  Widget ListCategory(String text) {
    List<Book> title = book!
        .where((title) => title.categoryId.toString().contains(text))
        .toList();
    return ListView.builder(
        itemCount: title.length,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(3),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          final books = title[index];
          return InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => MyDetails(book: title[index])));
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                margin: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).cardColor,
                ),
                child: Column(children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image(
                      image: NetworkImage(title[index].image),
                      height: 170,
                      width: 200,
                      fit: BoxFit.fill,
                    ),
                  ),
                  const Padding(padding: EdgeInsets.all(2)),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      title[index].title,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  )
                ]),
              ));
        });
  }
}
