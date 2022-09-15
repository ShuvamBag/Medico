import 'dart:async';
import 'package:ambulance_finder/Login%20Screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:hexcolor/hexcolor.dart';
class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
            ()=>Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context)=>LoginScreen()))
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    HexColor("#EE405F"),
                    HexColor("#657AD6"),
                   // HexColor("#FDC93A")
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight

              )
          ),
          child:Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                AnimatedTextKit(
                    animatedTexts:[ScaleAnimatedText('Medico',scalingFactor:0.4,textStyle: GoogleFonts.sacramento(fontSize: 120,color: Colors.white,fontWeight: FontWeight.bold),)]
                ),
              ],
            ),
          ),



        )
    );
  }
}
