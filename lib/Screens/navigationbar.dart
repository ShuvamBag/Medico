import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../Home Screen.dart';
import 'Book_ambulance.dart';
import 'Medical_stores.dart';
import 'Medical_support.dart';
import 'account_page.dart';

class navigationbar extends StatefulWidget {
  const navigationbar({Key? key}) : super(key: key);

  @override
  State<navigationbar> createState() => _navigationbarState();
}

class _navigationbarState extends State<navigationbar> {
  int myindex = 2;
  final screens = [
    MedicalStore(),
    BookAmbulance(),
    HomePage(),
    MedicalSupport(),
    AccountPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[myindex],
      backgroundColor: HexColor("#DBDEEF"),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: HexColor("#DBDEEF"),
        color: HexColor("#91A0E2"),
        animationDuration: Duration(milliseconds: 300),
        height: 75,
        index: myindex,
        items: [
          Icon(Icons.add_business_outlined),
          Icon(Icons.fire_truck_rounded),
          Icon(Icons.home_filled),
          Icon(Icons.medical_services_outlined),
          Icon(Icons.account_circle_rounded),
        ],
        onTap: (index) {
          setState(() {
            myindex = index;
          });

          //Handle button tap
        },
      ),
    );
  }
}
