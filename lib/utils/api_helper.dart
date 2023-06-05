import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sky_scrapper/model/covid_model.dart';
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

  Future<List<Covidmodel>> covid_Api()
  async {
    String link="https://corona.lmao.ninja/v2/countries/";
    var response=await http.get(Uri.parse(link));
    List jsonlist=[];
    jsonlist=jsonDecode(response.body);
    List<Covidmodel> covidlist=jsonlist.map((e) => Covidmodel.fromJson(e)).toList();
    return covidlist;
  }
}