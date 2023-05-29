import 'package:flutter/material.dart';
import 'package:library_app/View/About.dart';
import 'package:library_app/View/SearchScreen.dart';
import 'package:library_app/View/Home.dart' as Home;

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
        radius: 80,
        backgroundImage: NetworkImage(
          'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/3f9da3aa-ea81-4bda-b110-1db968a8ef67/dfvypxo-512f0fc1-965d-48dc-a04c-c9b80966f5f4.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcLzNmOWRhM2FhLWVhODEtNGJkYS1iMTEwLTFkYjk2OGE4ZWY2N1wvZGZ2eXB4by01MTJmMGZjMS05NjVkLTQ4ZGMtYTA0Yy1jOWI4MDk2NmY1ZjQucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.GdSdP728WTRfHuBX1FGM3yzZyR6v-Or4TX0BdZGynkE'
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
            builder:(context) => Home.Home(),
           )),
    ),
    ListTile(
        title: const Text('Tra Cứu'),
        leading: const Icon(Icons.search),
        onTap: ()=>
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context)=> const SearchScreen())),
    ),ListTile(
        title: const Text('Giới Thiệu'),
        leading: const Icon(Icons.info),
        onTap: ()=>
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const MyAbout(),))
    )]
  ));
}

