import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:sky_scrapper/model/covid_model.dart';
import 'package:sky_scrapper/provider/covid_provider.dart';

Covidprovider? cf;
Covidprovider? ct;

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {

  @override
  void initState() {
   Provider.of<Covidprovider>(context,listen: false).get_covid_data();
    super.initState();
  }
  Widget build(BuildContext context) {
    cf = Provider.of<Covidprovider>(context,listen: false);
    ct = Provider.of<Covidprovider>(context,listen: true);
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: 67.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/image/bg.png"),
                          fit: BoxFit.fill)),
                ),
                Container(
                  height: 24.h,
                  width: 100.w,
                  decoration: BoxDecoration(color: Color(0xffCFE3FC)),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 30.h,
                alignment: Alignment.centerLeft,
                width: 100.w,
                padding: EdgeInsets.all(40),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(35),
                        topLeft: Radius.circular(35))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Be aware\nStay healthy",
                        style: GoogleFonts.questrial(
                            color: Colors.black,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w400)),
                    SizedBox(height: 20),
                    Text(
                      "Welcome to COVID-19 information portal.",
                      style: GoogleFonts.poppins(
                          color: Colors.grey.shade500, fontSize: 11.sp),
                    ),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "GET STARTED",
                          style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: 10.sp),
                        ),
                        SizedBox(width: 10),
                        InkWell(
                          onTap: () {
                           cf!.get_covid_data();
                            Navigator.pushReplacementNamed(context, 'search');
                          },
                          child: CircleAvatar(
                            backgroundColor: Color(0xff9156EC),
                            child: Icon(Icons.arrow_forward,
                                color: Colors.white, size: 15.sp),
                            radius: 15.sp,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
