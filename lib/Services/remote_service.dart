import 'dart:convert';

import 'package:library_app/Model/Category.dart';
import 'package:library_app/Model/Book.dart';
import 'package:http/http.dart' as http;
class RemoteService{
  Future<List<Book>?> getBooks({String? query}) async{
    var client = http.Client();
    var uri = Uri.parse('http://10.0.2.2:5137/api/Books/');
    var response = await client.get(uri);
    if(response.statusCode==200){
      var json = response.body;
      return bookFromJson(json);
    }
  }

  Future<List<Book>?> getDetailBook(String id,{String? query}){
   final parsed = json.decode(id).cast<Map<String, dynamic>>(); 
   return parsed.map<Book>((json) =>Book.fromJson(json)).toList(); 
  }
 Future<List<Category>?> getCategory({String? query}) async{
    var client = http.Client();
    var uri = Uri.parse('http://10.0.2.2:5137/api/Categories/');
    var response = await client.get(uri);
    if(response.statusCode==200){
      var json = response.body;
      return categoryFromJson(json);
    }
  }
}