import 'package:activity_ring/activity_ring.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:svg_icon/svg_icon.dart';

import '../HealthData.dart';
import '../Reading_news.dart';
import '../news_api.dart';
import '../news_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<NewsApiModel>? newsList;
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    getNews().then((value) {
      setState(() {
        if (value.isNotEmpty) {
          newsList = value;
          isLoading = false;
        } else {
          print("List is Empty");
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#DBDEEF"),
      extendBody: true,
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
                    color: HexColor("#FFD55B"),
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
                      SizedBox(
                        width: 60,
                      ),
                      Container(
                        child: Text(
                          "Steps : ",
                          style: GoogleFonts.poppins(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                      ),
                      Container(
                        child: Text(
                          "5678 ",
                          style: GoogleFonts.poppins(
                              fontSize: 40, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
              ),

              SizedBox(
                height: 10,
              ),
              Container(
                width: 350,
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: HexColor("#EEC7B3"),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Image.asset(
                          "assets/heart.gif",
                          height: 110,
                          width: 110,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(),
                        width: 200,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Heart Care",
                              style: GoogleFonts.poppins(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Physical activity contributes to improved blood pressure, improved levels of cholesterol and other blood lipids, and weight control.",
                              style: GoogleFonts.poppins(fontSize: 13),
                            )
                          ],
                        ),
                      ),
                    ]),
              ),

              SizedBox(
                height: 10,
              ),
              Container(
                width: 350,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: HexColor("#D2E23D"),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Image.asset(
                        "assets/water_bottle.png",
                        height: 100,
                        width: 100,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(),
                        width: 200,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Stay Hydrated",
                              style: GoogleFonts.poppins(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "About 15.5 cups (3.7 liters) of fluids a day for men."
                              " About 11.5 cups (2.7 liters) of fluids a day for women.",
                              style: GoogleFonts.poppins(fontSize: 13),
                            )
                          ],
                        ),
                      ),
                    ]),
              ),

              SizedBox(
                height: 10,
              ),

              //Articles
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Container(
                  // height: MediaQuery.of(context).size.height,
                  //width: 600,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: HexColor("#BFC9FE"),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Articles",
                        style: GoogleFonts.poppins(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: Column(
                          children: [
                            isLoading
                                ? Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                      height: 20,
                                      width: 20,
                                      child: CircularProgressIndicator(),
                                    ),
                                  )
                                : Container(
                                    child: ListView.builder(
                                        physics: NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        itemCount: newsList?.length,
                                        itemBuilder: (context, index) {
                                          return Container(
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 0, vertical: 5),
                                            child: Card(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                              elevation: 0,
                                              child: GestureDetector(
                                                onTap: () =>
                                                    Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                    builder: (_) => ReadingNews(
                                                      model: newsList![index],
                                                    ),
                                                  ),
                                                ),
                                                child: Stack(
                                                  children: [
                                                    ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                        child: Image.network(
                                                            newsList![index]
                                                                .imageUrl)),
                                                    Positioned(
                                                      left: 0,
                                                      right: 0,
                                                      bottom: 0,
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            15),
                                                                gradient:
                                                                    LinearGradient(
                                                                  colors: [
                                                                    Colors
                                                                        .black12
                                                                        .withOpacity(
                                                                            0),
                                                                    Colors
                                                                        .black,
                                                                  ],
                                                                  begin: Alignment
                                                                      .topCenter,
                                                                  end: Alignment
                                                                      .bottomCenter,
                                                                )),
                                                        padding:
                                                            EdgeInsets.fromLTRB(
                                                                10, 15, 10, 5),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                                newsList![
                                                                        index]
                                                                    .title,
                                                                style: GoogleFonts.poppins(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600)),
                                                            SizedBox(
                                                              height: 10,
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        }),
                                  )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
