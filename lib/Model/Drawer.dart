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
          'https://scontent.fsgn19-1.fna.fbcdn.net/v/t1.6435-9/121618520_138856747945991_8019882942603448849_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=Fp2rZXf-cO0AX_wyyma&_nc_ht=scontent.fsgn19-1.fna&oh=00_AfDiYzz7k7NecIqR6lGemPQ5vMzdBWb48VsKhJQWhqoJ_Q&oe=643FC916'
        ),
      ),
       SizedBox(height: 12),
       Text('Libary App', style: TextStyle(fontSize: 28,color: Colors.white)),
      ],),
  )));
  Widget builderTitle(BuildContext context) => Container(
    child: Column(
    children: [
      ListTile(
        title: const Text('Home'),
        leading: const Icon(Icons.home),
        onTap: ()=>
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder:(context) => const Home.MyHome(title: 'Home',),
           )),
    ),
    ListTile(
        title: const Text('Search'),
        leading: const Icon(Icons.search),
        onTap: ()=>
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context)=>const MySearch())),
    ),ListTile(
        title: const Text('About'),
        leading: const Icon(Icons.info),
        onTap: ()=>
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const MyAbout(),))
    )]
  ));
}

