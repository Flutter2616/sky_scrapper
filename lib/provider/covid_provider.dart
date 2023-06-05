import 'package:flutter/material.dart';
import 'package:sky_scrapper/model/covid_model.dart';
import 'package:sky_scrapper/utils/api_helper.dart';

class Covidprovider extends ChangeNotifier
{
  List<Covidmodel> covid=[];
  List<Covidmodel> filterlist=[];
  List<Covidmodel> searchlist=[];
  Future<List<Covidmodel>> get_covid_data()
   async {
    covid=await Apihelper.apihelper.covid_Api();
    filterlist=List.from(covid);
    return covid;
    // print("${covidlist[0].country}");
    // notifyListeners();
  }

  void searchfilter(String value)
  {
    if(value.isEmpty)
      {
        filterlist=List.from(covid);
      }
      else
        {
          // print(value);
          searchlist.clear();
          for(var c in covid)
            {
              if(c.country!.toLowerCase().contains(value.toLowerCase()))
                {
                  searchlist.add(c);
                }
            }
          filterlist=List.from(searchlist);
        }
      notifyListeners();
  }


}