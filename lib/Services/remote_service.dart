import 'dart:convert';

import 'package:library_app/Model/Category.dart';
import 'package:library_app/Model/Book.dart';
import 'package:library_app/Model/LibraryCard.dart';
import 'package:http/http.dart' as http;

class RemoteService {
  var client = http.Client();
  // String baseuri = "http://10.0.2.2:5137";
  String baseuri = "http://192.168.1.12";
  Future<List<Book>?> getBooks({String? query}) async {
     var uri = Uri.parse(baseuri + '/api/Books/?limit=1000');
    // var uri = Uri.parse('http://10.20.5.57/api/Books/?limit=1000');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return bookFromJson(json);
    }
  }

Future<List<LibraryCard>?> getLibraryCard({String? query}) async {
  var uri = Uri.parse(baseuri + "/api/LibraryCards/utils/rawlist");
  var res = await client.get(uri);
  if(res.statusCode==200){
    var json = res.body;
    return libraryCardFromJson(json);
  }
}
  // Future<List<Book>?> getDetailBook(String id,{String? query}){
  //  final parsed = json.decode(id).cast<Map<String, dynamic>>();
  //  return parsed.map<Book>((json) =>Book.fromJson(json)).toList();
  // }

  Future<List<Category>?> getCategory({String? query}) async {
    var uri = Uri.parse(baseuri + '/api/Categories');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return categoryFromJson(json);
    }
  }
}
