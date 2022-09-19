import 'package:flutter/material.dart';

class MedicalSupport extends StatefulWidget {
  const MedicalSupport({super.key});

  @override
  State<MedicalSupport> createState() => _MedicalSupportState();
}

class _MedicalSupportState extends State<MedicalSupport> {
  int index = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Medical Support")),
    );
  }
}
