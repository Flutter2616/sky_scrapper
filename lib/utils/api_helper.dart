import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sky_scrapper/model/user_model.dart';
class Apihelper
{
  static Apihelper apihelper=Apihelper();

  Future<Usermodel> user_api()
  async {
    String link='https://randomuser.me/api/';
    var response=await http.get(Uri.parse(link));
    var json=jsonDecode(response.body);
    return Usermodel.fromJson(json);
  }
}