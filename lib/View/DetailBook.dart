import 'package:flutter/material.dart';
import 'package:library_app/Model/Book.dart';
import 'package:library_app/View/Home.dart' as Home;
import 'package:readmore/readmore.dart';


class MyApp extends StatelessWidget {
  final Book book;
  const MyApp({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Library',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  MyDetails(book: book));
  }
}

class MyDetails extends StatefulWidget {
  const MyDetails({super.key, required this.book});

  final Book book;

  @override
  State<MyDetails> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyDetails> {
  @override
  Widget build(BuildContext context) {
    var authorCategory = widget.book.author;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(widget.book.title),
      ),
      body:
      SingleChildScrollView(
        child: Container(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Image(
                    image: NetworkImage("https://picsum.photos/seed/${widget.book.bookId}/230/280"),
                    height: 450,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.fill,
                  ),
                ),
                Text(widget.book.title, style: TextStyle(fontSize:32,fontWeight: FontWeight.w900),),
                Text(authorCategory,style: TextStyle(fontSize: 24,fontWeight: FontWeight.w400)),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Align( 
                    alignment: Alignment.topLeft,
                    child: ReadMoreText(
                    trimLength: 50,
                    widget.book.summary,
                    style: TextStyle(fontSize: 17,fontWeight: FontWeight.w300),
                    trimCollapsedText: '...Show more',
                    trimExpandedText: ' Show less',
                    moreStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.blueAccent),
                    lessStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.blueAccent),
                    )
                  ),
                )
              ],
            ),
          )),
        );
    
  }
}
