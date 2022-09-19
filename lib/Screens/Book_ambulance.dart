import 'package:flutter/material.dart';

class BookAmbulance extends StatefulWidget {
  const BookAmbulance({super.key});

  @override
  State<BookAmbulance> createState() => _BookAmbulance();
}

class _BookAmbulance extends State<BookAmbulance> {
  int index = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Book Ambulance")),
    );
  }
}
