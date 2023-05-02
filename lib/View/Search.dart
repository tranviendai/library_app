import 'package:flutter/material.dart';
import 'package:library_app/Model/Drawer.dart' as drawer;

class MySearch extends StatefulWidget {
  const MySearch({super.key});

  @override
  State<MySearch> createState() => MySearchPage();
}

class MySearchPage extends State<MySearch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title:const Text('Tra Cứu'),
      ),
      drawer: const drawer.NavigationDrawer(),
      );
  }
}