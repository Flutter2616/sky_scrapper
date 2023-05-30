import 'package:flutter/cupertino.dart';
import 'package:sky_scrapper/model/user_model.dart';
import 'package:sky_scrapper/utils/api_helper.dart';

class Userprovider extends ChangeNotifier
{
  Usermodel? usermodel;
  Future<Usermodel?> user_api_calling()
  async {
    usermodel=await Apihelper.apihelper.user_api();
    return usermodel;
  }

  void rendomuser(user_api)
  {
    usermodel=user_api;
    notifyListeners();
  }
}