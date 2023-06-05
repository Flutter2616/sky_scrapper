import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:sky_scrapper/provider/covid_provider.dart';
import 'package:sky_scrapper/view/covid_view/home_screen.dart';

class Searchscreen extends StatefulWidget {
  const Searchscreen({super.key});

  @override
  State<Searchscreen> createState() => _SearchscreenState();
}

class _SearchscreenState extends State<Searchscreen> {
  TextEditingController txtsearch = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                  controller: txtsearch,
                  onChanged: (value) {
                    cf!.searchfilter(value);
                  },
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: CircleAvatar(
                          backgroundColor: Colors.blue,
                          child: Icon(Icons.search,
                              size: 12.sp, color: Colors.white),
                          radius: 10.sp,
                        ),
                      ),
                      hintText: "search city",
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(20)))),
            ),
            Consumer<Covidprovider>(
              builder: (context, value, child) {
                return Expanded(
                    child: ListView.builder(
                        itemBuilder: (context, index) {
                          return ListTile(
                            tileColor: Colors.grey.shade100,
                            onTap: () {
                              Navigator.pushReplacementNamed(context, 'detail',arguments: cf!.filterlist[index]);
                            },
                            title: Text("${value.filterlist[index].country}"),
                            subtitle: Text(
                                "Population: ${value.filterlist[index].population}"),leading: CircleAvatar(backgroundImage: NetworkImage("${cf!.filterlist[index].countryInfo!.flag}"),radius: 9.w),
                          );
                        },
                        itemCount: value.filterlist.length));
              },
            )
          ],
        ),
      ),
    );
  }
}
