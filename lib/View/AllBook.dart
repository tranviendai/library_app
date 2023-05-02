import 'package:flutter/material.dart';
import 'Home.dart' as Home;
import 'DetailBook.dart';
class AllBook extends StatefulWidget {
  const AllBook({super.key});

  @override
  State<AllBook> createState() => _AllBookState();
}

class _AllBookState extends State<AllBook> {
    final TextEditingController _controller = new TextEditingController();

   bool searchBool = false;
  List<int> _searchIndexList = [];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:  Scaffold(
        backgroundColor: Color.fromARGB(255, 218, 218, 218),
        appBar: AppBar(  
          backgroundColor: Colors.blue,
          title: !searchBool ? Text("Xem Tất Cả") : searchText(),
          leading: IconButton(icon: Icon(Icons.arrow_back),onPressed: () => Navigator.pop(context),),
          actions: !searchBool
              ? [
                  IconButton(
                      onPressed: () {
                        setState(() {
                          searchBool = true;
                          _searchIndexList = [];
                        });
                      },
                      icon: const Icon(
                        Icons.search,
                      )),
                PopupMenuButton(itemBuilder: (context)=>[
                   PopupMenuItem( onTap:()=>setState(() {
                         Home.HomeState.sort = !Home.HomeState.sort;
                   }),
                    child: const Text("Sắp Xếp"),),
                ])
                ]
              : [
                  IconButton(
                      onPressed: () {
                        setState(() {
                          searchBool = false;
                        });
                      },
                      icon: const Icon(
                        Icons.search,
                      )),
                ],),
        body: !searchBool? GridView.builder(
            itemCount: Home.HomeState.book!.length,
            scrollDirection: Axis.vertical,
            padding: const EdgeInsets.all(3),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 1 / 1.4),
            itemBuilder: (context, index) {
              final sortBooks = Home.HomeState.book
                ?..sort((item1, item2) => Home.HomeState.sort
                    ? item1.title.toLowerCase().compareTo(item2.title.toLowerCase())
                    : item2.title
                        .toLowerCase()
                        .compareTo(item1.title.toLowerCase()));
              final books = Home.HomeState.book![index];
              return InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => MyDetails(book: Home.HomeState.book![index])));
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Column(children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image(
                          image: NetworkImage("https://picsum.photos/seed/${Home.HomeState.book![index].bookId}/170/170"),
                          height: 200,
                          width: 170,
                          fit: BoxFit.fill,
                        ),
                      ),
                       const Padding(padding: EdgeInsets.all(2)),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                         Home.HomeState.book![index].title.length > 15 ? Home.HomeState.book![index].title.substring(0,15)+'...':Home.HomeState.book![index].title,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold,color:Colors.black),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                         Home.HomeState.book![index].author.length > 15 ? Home.HomeState.book![index].author.substring(0,15)+'...':Home.HomeState.book![index].author,
                          style: const TextStyle(
                              fontSize: 16,color:Colors.black),
                          textAlign: TextAlign.left,
                        ),
                      )
                    ]),
                  ));
            }) : searchView()
      ),
    );
  }
  
  Widget searchText() {
    return TextField(
      controller: _controller,
      onChanged: (String s) {
        setState(() {
          _searchIndexList = [];
          for (int i = 0; i < Home.HomeState.book!.length; i++) {
            if (Home.HomeState.book![i].title.contains(s)) {
              _searchIndexList.add(i);
            }
          }
        });
      },
      autofocus: true,
      cursorColor: Colors.white,
      style: TextStyle(color: Colors.white),
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
          enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white)),
          focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white)),
          suffixIcon: IconButton(
              icon: Icon(Icons.clear, color: Colors.white),
              onPressed: () {
                _controller.clear();
                setState(() {
                  searchBool = false;
                });
              }),
          hintText: 'Tìm Kiếm',
          hintStyle: TextStyle(color: Colors.white,fontSize: 18, fontWeight: FontWeight.bold))
    );
  }

  Widget searchView() {
    return GridView.builder(
        itemCount: _searchIndexList.length,
        padding: const EdgeInsets.all(3),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, childAspectRatio: 1 / 1.25),
        itemBuilder: (context, index) {
          index = _searchIndexList[index];
          return searchListBook(context, index);
        });
  }
}

Widget searchListBook(BuildContext context, int index) {
  return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                MyDetails(book: Home.HomeState.book![index])));
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color:Colors.white,),
        child: Column(children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image(
              image: NetworkImage("https://picsum.photos/seed/${Home.HomeState.book![index].bookId}/170/170"),
              height: 170,
              fit: BoxFit.cover,
            ),
          ),
          const Padding(padding: EdgeInsets.all(2)),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              Home.HomeState.book![index].title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              textAlign: TextAlign.start,
            ),
          )
        ]),
      ));
}