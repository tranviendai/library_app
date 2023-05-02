import 'package:flutter/material.dart';
import 'package:library_app/Model/Book.dart';
import 'package:library_app/Services/remote_service.dart';
import 'package:library_app/View/AllBook.dart';
import 'package:library_app/View/DetailBook.dart';
import 'package:library_app/Model/Category.dart';
import 'package:readmore/readmore.dart';
import 'package:library_app/Model/Drawer.dart' as drawer;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {
  static List<Book>? book;
  static List<Book> title = book!;
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
      return Scaffold(
        appBar: AppBar(
          title: const Text("Trang Chủ"),
        ),
         drawer: const drawer.NavigationDrawer(),
        body: Container(
          child: SingleChildScrollView(
            child: SizedBox(
                child: Column(
              children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    Container( padding: EdgeInsets.only(left: 20),
                    child: Text("Sách",style: Theme.of(context).textTheme.titleLarge),),
                     Container(
                  padding: EdgeInsets.only(right: 10),
                  child: TextButton(
                    onPressed: (){Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => AllBook(), fullscreenDialog: false),);},
                    child: Text("Xem Tất Cả", style: TextStyle(color: Colors.blue, fontSize: 24,fontWeight: FontWeight.bold)),
                  ),
                ),
                  ],),
                 SizedBox(
                  height: 280,
                  child: ListBook(),
                ),
                Container(
                    padding: EdgeInsets.all(5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                       Text( "Thể Loại: ",style: Theme.of(context).textTheme.titleLarge,
                        ),
                        Container(
                          width: 130,
                          padding: const EdgeInsets.only(left: 20),
                          child: DropdownButtonFormField(
                            decoration:const InputDecoration(
                              border: InputBorder.none
                            ),
                              value: 1,
                              items: category!.map((location) {
                                return DropdownMenuItem(
                                  value: location.categoryId,
                                  child:  Text(
                                    location.nameCategory,
                                    style: Theme.of(context).textTheme.titleMedium
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
                  height: 500,
                  child: ListCategory(selectItemCategory.toString()),
                ),
              ],
            )),
          ),
        ),
      );
    }
  }

  Widget ListBook() {
    return ListView.builder(
        itemCount: book!.length,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
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
                        builder: (context) => MyDetails(book: book![index])));},
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Column(children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image(
                          image: NetworkImage("https://picsum.photos/seed/${book![index].bookId}/170/170"),
                          height: 200,
                          width: 160,
                          fit: BoxFit.fill,
                        ),
                      ),
                      const Padding(padding: EdgeInsets.all(2)),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                         book![index].title.length > 15 ? book![index].title.substring(0,15)+'...':book![index].title,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold,color:Colors.black),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                         book![index].author.length > 15 ? book![index].author.substring(0,15)+'...':book![index].author,
                          style: const TextStyle(
                              fontSize: 16,color:Colors.black),
                          textAlign: TextAlign.left,
                        ),
                      )
                    ]),
                  ));
        });
  }

  Widget ListCategory(String text) {
     title = book!
    .where((title) => title.categoryId.toString().contains(text))
    .toList();
    return ListView.builder(
        itemCount: title.length,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          final books = title[index];
          return InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => MyDetails(book: books)));
              },
              child: Card(
                color: Colors.white,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  ClipRRect(
                    child: Image(
                      height: 110,
                      image: NetworkImage("https://picsum.photos/seed/${books.bookId}/170/170"),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.all(2)),
                Container(
                  padding: EdgeInsets.only(top: 20),
                  child:  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                     Text(
                      books.title.length > 20 ? books.title.substring(0,20)+"...": books.title,
                      style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),
                      textAlign: TextAlign.left,
                    ),
                    Text(books.author,
                    style: TextStyle(color: Colors.black,fontSize: 16),
                    )
                 ],),
                )
                ]),
              ));
        });
  }
}
