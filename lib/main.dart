import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sky_scrapper/provider/user_provider.dart';
import 'package:sky_scrapper/view/user_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Userprovider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/':(context) => Userscreen(),
        },
      ),
    ),
  );
}
