import 'package:flutter/material.dart';
import 'package:library_app/Model/Drawer.dart' as drawer;

class MyAbout extends StatefulWidget {
  const MyAbout({super.key});

  @override
  State<MyAbout> createState() => _MyAboutState();
}

class _MyAboutState extends State<MyAbout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('About'),
      ),
      drawer: drawer.NavigationDrawer(),
    );
  }
}