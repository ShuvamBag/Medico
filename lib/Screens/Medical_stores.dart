import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../Home Screen.dart';
import 'Book_ambulance.dart';
import 'Medical_support.dart';
import 'account_page.dart';

class MedicalStore extends StatefulWidget {
  const MedicalStore({super.key});

  @override
  State<MedicalStore> createState() => _MedicalStoreState();
}

class _MedicalStoreState extends State<MedicalStore> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Medical Store")),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: HexColor("#DBDEEF"),
        color: HexColor("#91A0E2"),
        animationDuration: Duration(milliseconds: 300),
        height: 75,
        index: index,
        onTap: (index) {
          if (index == 0) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => MedicalStore()));
          }
          if (index == 1) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => BookAmbulance()));
          }
          if (index == 2) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          }
          if (index == 3) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => MedicalSupport()));
          }
          if (index == 4) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AccountPage()));
          }
        },
        items: [
          Icon(Icons.add_business_outlined),
          Icon(Icons.fire_truck_rounded),
          Icon(Icons.home_filled),
          Icon(Icons.medical_services_outlined),
          Icon(Icons.account_circle_rounded),
        ],
      ),
    );
  }
}