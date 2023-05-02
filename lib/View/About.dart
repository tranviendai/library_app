import 'package:flutter/material.dart';
import 'package:library_app/Model/Drawer.dart' as drawer;
import 'Home.dart' as home;

class MyAbout extends StatefulWidget {
  const MyAbout({super.key});

  @override
  State<MyAbout> createState() => _MyAboutState();
}

class _MyAboutState extends State<MyAbout> {
  String content = 'HUFLIT Library là một thư viện hiện đại được thiết kế dành cho trường học, với mục đích giúp trường quản lý và vận hành thư viện một cách dễ dàng và hiệu quả hơn. Hệ thống được xây dựng để phục vụ 3 loại người dùng chính: quản trị viên, thủ thư và đọc giả. Quản trị viên có thể kiểm tra toàn bộ hệ thống, tạo tài khoản cho thủ thư và giám sát hoạt động của thư viện thông qua mục thống kê báo cáo. Thủ thư quản lý các hoạt động hàng ngày của thư viện, bao gồm quản lý sách, quản lý đọc giả và mượn trả sách. Đọc giả có thể tìm kiếm sách theo nhiều tiêu chí khác nhau và tra cứu lịch sử mượn thông qua mã thẻ thư viện. HUFLIT Library còn hỗ trợ quản lý sách chi tiết với các thông tin như tên, tác giả, thể loại, năm xuất bản và tình trạng sách. Điều này giúp cho việc quản lý sách và đầu sách trở nên dễ dàng và thuận tiện hơn bao giờ hết.';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Giới Thiệu'),
      ),
      drawer: drawer.NavigationDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(                
              margin: EdgeInsets.only(top: 20,bottom: 5),
            child: Text("Giới Thiệu Chung",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),),
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
                        alignment: Alignment.center,
                        child: Text(
                         categoires.nameCategory,
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold,color:Colors.black),
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