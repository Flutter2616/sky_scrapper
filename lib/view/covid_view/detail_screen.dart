import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:sky_scrapper/model/covid_model.dart';
import 'package:sky_scrapper/provider/covid_provider.dart';
import 'package:sky_scrapper/view/covid_view/home_screen.dart';

class Detailscreen extends StatefulWidget {
  const Detailscreen({super.key});

  @override
  State<Detailscreen> createState() => _DetailscreenState();
}

class _DetailscreenState extends State<Detailscreen> {
  @override
  Widget build(BuildContext context) {
    cf = Provider.of<Covidprovider>(context, listen: false);
    ct = Provider.of<Covidprovider>(context, listen: true);
    Covidmodel c=ModalRoute.of(context)!.settings.arguments as Covidmodel;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: FutureBuilder(future: cf!.get_covid_data(),
          builder: (context, snapshot) {
            if(snapshot.hasError)
              {
                return Center(child: Text("${snapshot.error}"),);
              }
            else if(snapshot.hasData)
              {
                List covid=[];
                covid=snapshot.data!;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircleAvatar(
                                radius: 15.sp,
                                backgroundImage: AssetImage("assets/image/bg.png")),
                            Text("${c.country}"),
                            InkWell(onTap: () {
                              Navigator.pushNamed(context, 'search');
                            },
                              child: CircleAvatar(
                                  radius: 15.sp,
                                  backgroundColor: Colors.purple.shade100,
                                  child: Icon(Icons.search, color: Colors.white)),
                            ),
                          ],
                        ),
                        SizedBox(height: 30),
                        Image.asset("assets/image/Banner.png",
                            height: 20.h, width: 90.w, fit: BoxFit.fill),
                        SizedBox(height: 20),
                        Image.asset("assets/image/Tab.png",
                            height: 7.h, width: 90.w, fit: BoxFit.fill),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(width: 20),
                            Text("Country",
                                style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w500)),
                            SizedBox(width: 15),
                            Text("State",
                                style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w500)),
                            SizedBox(width: 15),
                            Text("City",
                                style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w500)),
                            SizedBox(width: 15),
                            Text("Worldwide",
                                style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w500)),
                            SizedBox(width: 15),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 40.w,
                              height: 10.h,
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  color: Colors.red.shade50,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "confirmed",
                                          style: GoogleFonts.poppins(
                                              color: Colors.red,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 3.w),
                                        )
                                      ]),
                                  Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text("${c.cases}",
                                            style: GoogleFonts.poppins(
                                                color: Colors.red,
                                                fontWeight: FontWeight.w700,
                                                fontSize: 4.w))
                                      ]),
                                ],
                              ),
                            ),
                            Container(
                              width: 40.w,
                              height: 10.h,
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  color: Colors.blue.shade50,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text("Active",
                                            style: GoogleFonts.poppins(
                                                color: Colors.blue,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 3.w))
                                      ]),
                                  Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text("${c.active}",
                                            style: GoogleFonts.poppins(
                                                color: Colors.blue,
                                                fontWeight: FontWeight.w700,
                                                fontSize: 4.w))
                                      ]),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 40.w,
                              height: 10.h,
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  color: Colors.green.shade50,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Recoverd",
                                          style: GoogleFonts.poppins(
                                              color: Colors.green.shade700,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 4.w),
                                        )
                                      ]),
                                  Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text("${c.recovered}",
                                            style: GoogleFonts.poppins(
                                                color: Colors.green.shade700,
                                                fontWeight: FontWeight.w700,
                                                fontSize: 4.w))
                                      ]),
                                ],
                              ),
                            ),
                            Container(
                              width: 40.w,
                              height: 10.h,
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade100,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text("Death",
                                            style: GoogleFonts.poppins(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 3.w))
                                      ]),
                                  Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text("${c.deaths}",
                                            style: GoogleFonts.poppins(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.w700,
                                                fontSize: 4.w))
                                      ]),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Image.asset("assets/image/box.png",
                            height: 28.h, width: 90.w, fit: BoxFit.fill),
                      ],
                    ),
                  ),
                );
              }
            return Center(child: CircularProgressIndicator());
          },
        )
      ),
    );
  }
}
