import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:library_app/Model/Book.dart';
import 'package:library_app/View/DetailBook.dart';
import 'package:library_app/View/Home.dart' as Home;
import 'package:library_app/Model/Drawer.dart' as drawer;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Library',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Color.fromARGB(255, 236, 236, 236)
      ),
      
      home: const MyHome(title: 'Home'),
    );
  }
}

class MyHome extends StatefulWidget {
  const MyHome({super.key, required this.title});
  final String title;

  @override
  State<MyHome> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    return Home.Home();
  }

}
