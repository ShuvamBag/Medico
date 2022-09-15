import 'package:activity_ring/activity_ring.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:svg_icon/svg_icon.dart';

import 'HealthData.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        reverse: true,
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  child: TextField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.search_rounded,
                          color: HexColor("#5A71CE"),
                        ),
                        hintText: "Search",
                        suffixIcon: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                          child: Icon(
                            Icons.mic_rounded,
                            color: HexColor("#5A71CE"),
                          ),
                        ),
                        hintStyle: GoogleFonts.poppins(fontSize: 15),
                        filled: true,
                        fillColor: HexColor("#BFC9FE"),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 0),
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: HexColor("#FFAEC4"),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(children: [
                    Container(
                      height: 100,
                      width: 100,
                      child: Image.asset("assets/doctor.png"),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "How do you feel ?",
                          style: GoogleFonts.poppins(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          "Fill your medical card right now",
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HealthData()),
                              );
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.fromLTRB(40, 0, 30, 0),
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: HexColor("#7C8EDB"),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              "Get Started",
                              style: GoogleFonts.poppins(
                                  fontSize: 14, color: Colors.white),
                            ),
                          ),
                        )
                      ],
                    ))
                  ]),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Container(
                  height: 100,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: HexColor("#FBC70B"),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 8, 0, 8),
                        child: Ring(
                          percent: 60,
                          color: RingColorScheme(ringGradients: [
                            [Colors.red, Colors.yellow],
                            [Colors.yellow, Colors.green]
                          ]),
                          radius: 30,
                          width: 10,
                          child: Center(child: SvgIcon("assets/sneakers.svg")),
                        ),
                      ),
                      SizedBox(width: 60,),
                      Container(
                        child: Text("Steps : ",style: GoogleFonts.poppins(fontSize:20,fontWeight: FontWeight.bold),),
                      ),
                      Container(
                        child: Text("5678 ",style: GoogleFonts.poppins(fontSize:40,fontWeight: FontWeight.bold),),
                      )

                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      backgroundColor: HexColor("#DBDEEF"),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: HexColor("#DBDEEF"),
        color: HexColor("#91A0E2"),
        animationDuration: Duration(milliseconds: 300),
        height: 75,
        onTap: (index) {
          print(index);
        },
        items: [
          Icon(Icons.home_filled),
          Icon(Icons.add_business_outlined),
          Icon(Icons.fire_truck_rounded),
          Icon(Icons.medical_services_outlined),
          Icon(Icons.account_circle_rounded),
        ],
      ),
    );
  }
}
