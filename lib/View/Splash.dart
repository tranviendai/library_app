import 'dart:async';

import 'package:flutter/material.dart';
import 'package:library_app/View/Home.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});


  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3),()
    {Navigator.push(context, MaterialPageRoute(builder: (context) => const Home()));});
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  height: 200,
                  'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/3f9da3aa-ea81-4bda-b110-1db968a8ef67/dfvypxo-512f0fc1-965d-48dc-a04c-c9b80966f5f4.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcLzNmOWRhM2FhLWVhODEtNGJkYS1iMTEwLTFkYjk2OGE4ZWY2N1wvZGZ2eXB4by01MTJmMGZjMS05NjVkLTQ4ZGMtYTA0Yy1jOWI4MDk2NmY1ZjQucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.GdSdP728WTRfHuBX1FGM3yzZyR6v-Or4TX0BdZGynkE'),
              SizedBox(height: 20,),
              const Text( "Welcome To Library App", style: TextStyle(fontSize: 28,color: Colors.white,fontWeight: FontWeight.bold),)
              ],
            ),
      ),
    );
  }
}