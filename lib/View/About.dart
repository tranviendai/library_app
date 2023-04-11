import 'package:flutter/material.dart';
import 'package:library_app/Model/Drawer.dart' as drawer;
import 'Home.dart' as home;

class MyAbout extends StatefulWidget {
  const MyAbout({super.key});

  @override
  State<MyAbout> createState() => _MyAboutState();
}

class _MyAboutState extends State<MyAbout> {
  String content = 'Bài viết sẽ đi từ lúc khởi tạo project - giải thích về những components cơ bản nhất đến việc sử dụng nó trong thực tế. Nếu biết những component nào rồi thì các bạn có thể lướt qua nhé. Vì mới học nên mình sẽ tạm thời bỏ qua các convension của Flutter trong code cho dễ hiểu.';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('About'),
      ),
      drawer: drawer.NavigationDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(                
              margin: EdgeInsets.only(top: 20,bottom: 5),
            child: Text("Quy Định Về Thư Viện",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),),
            Container(
              padding: EdgeInsets.all(10),
              child: Center(child: Text(content,style: TextStyle(fontSize: 20,),),),),
              Container(
              margin: EdgeInsets.only(top: 20,bottom: 5),
                child: const Text("Các Thể Loại Hiện Có Ở Thư Viện",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
              GridView.builder(
        itemCount: home.HomeState.category!.length,
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.all(3),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4, childAspectRatio: 1.3),
        itemBuilder: (context, index) {
          final categoires =  home.HomeState.category![index];
          return InkWell(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Column(children: [
                      const Padding(padding: EdgeInsets.all(2)),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                         categoires.nameCategory,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold,color:Colors.black),
                          textAlign: TextAlign.left,
                        ),
                      )
                    ]),
                  ));
        })
          ],
        ),
      ),
    );
  }
}