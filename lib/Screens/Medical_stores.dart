import 'package:flutter/material.dart';

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
    );
  }
}
