import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:sky_scrapper/provider/covid_provider.dart';
import 'package:sky_scrapper/provider/user_provider.dart';
import 'package:sky_scrapper/view/covid_view/detail_screen.dart';
import 'package:sky_scrapper/view/covid_view/home_screen.dart';
import 'package:sky_scrapper/view/covid_view/search_screen.dart';
import 'package:sky_scrapper/view/user_view/user_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Userprovider()),
        ChangeNotifierProvider(create: (context) => Covidprovider()),
      ],
      child: Sizer(builder: (context, orientation, deviceType) {
        return MaterialApp(
          // initialRoute: 'detail',
          debugShowCheckedModeBanner: false,
          routes: {
            // '/':(context) => Userscreen(),
            '/':(context) => Homescreen(),
            'detail':(context) => Detailscreen(),
            'search':(context) => Searchscreen(),
          },
        );
      },
      ),
    ),
  );
}
