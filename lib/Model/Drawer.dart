import 'package:flutter/material.dart';
import 'package:library_app/View/About.dart';
import 'package:library_app/View/Search.dart';
import 'package:library_app/main.dart' as Home;

class NavigationDrawer extends StatelessWidget{
  const NavigationDrawer({super.key});
  @override
  Widget build(BuildContext context) => Drawer(
    child: SingleChildScrollView(
      child: Column(
        children: [
          builderHeader(context),
          builderTitle(context),
    ],)),
  );  
  Widget builderHeader(BuildContext context) => Material(
    color: Colors.blue,
    child:InkWell(
      onTap: (){},
    child:Container(
    padding: EdgeInsets.only(
        top:24 + MediaQuery.of(context).padding.top,
        bottom: 24,
        left: 85.5,
        right: 85.5
      ),
      child: Column(children: const [
          CircleAvatar(
        radius: 52,
        backgroundImage: NetworkImage(
          'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/3f9da3aa-ea81-4bda-b110-1db968a8ef67/dfvynd0-bce1f455-5668-44f3-a97b-40021db9a5b3.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcLzNmOWRhM2FhLWVhODEtNGJkYS1iMTEwLTFkYjk2OGE4ZWY2N1wvZGZ2eW5kMC1iY2UxZjQ1NS01NjY4LTQ0ZjMtYTk3Yi00MDAyMWRiOWE1YjMucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.Y3BpHxrWiP4zMI_uHLyuvZgtYx-u8jbrU3Xn6ih8Z4s'
        ),
      ),
       SizedBox(height: 12),
       Text('  LIBRARY  ', style: TextStyle(fontSize: 28,color: Colors.white)),
      ],),
  )));
  Widget builderTitle(BuildContext context) => Container(
    child: Column(
    children: [
      ListTile(
        title: const Text('Trang Chủ'),
        leading: const Icon(Icons.home),
        onTap: ()=>
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder:(context) => const Home.MyHome(title: 'Trang Chủ',),
           )),
    ),
    ListTile(
        title: const Text('Tra Cứu'),
        leading: const Icon(Icons.search),
        onTap: ()=>
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context)=>const MySearch())),
    ),ListTile(
        title: const Text('Giới Thiệu'),
        leading: const Icon(Icons.info),
        onTap: ()=>
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const MyAbout(),))
    )]
  ));
}

