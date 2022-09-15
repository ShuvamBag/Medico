import 'package:ambulance_finder/Home%20Screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import 'SignUp Screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: SingleChildScrollView(
          reverse: true,
          child: Stack(children: <Widget>[
      Image.asset(
          "assets/login_wallpaper.png",
          fit: BoxFit.cover,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,

      ),
      SafeArea(
          child: Column(
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 60, 0, 0),
                  child: GradientText(
                    "LOG IN",
                    style: GoogleFonts.poppins(
                        fontSize: 40,
                        fontWeight: FontWeight.w700,),
                         colors: [HexColor("#FF6B90"),
                           HexColor("#8390D9"),

                  ],
                    ),
                ),
              ),

              Container(
                margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Image.asset("assets/login.gif"),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextField(
                    style: GoogleFonts.poppins(fontSize: 20,),
                    cursorColor: HexColor("#5269EE"),
                    cursorHeight: 24,
                    decoration: InputDecoration(

                        filled: true,
                        fillColor: HexColor("#BCC6F9"),

                        prefixIcon: Icon(Icons.person),
                        hintText: "Email Address",
                        border: OutlineInputBorder(borderSide: BorderSide.none,borderRadius: BorderRadius.circular(30)),
                        hintStyle: GoogleFonts.poppins(
                          fontSize: 20,
                        ),

                        focusedBorder: OutlineInputBorder(

                          borderRadius: BorderRadius.circular(45),

                          borderSide: BorderSide(
                            color: HexColor("#7083D9"),
                            width: 2.0,
                          ),
                        )),
                  ),
                ),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: TextField(
                    obscureText: true,
                    style: GoogleFonts.poppins(fontSize: 20,),
                    cursorColor: HexColor("#5269EE"),
                    cursorHeight: 24,
                    decoration: InputDecoration(

                        filled: true,
                        fillColor: HexColor("#E2C2FF"),

                        prefixIcon: Icon(Icons.key),

                        hintText: "Password",
                        border: OutlineInputBorder(borderSide: BorderSide.none,borderRadius: BorderRadius.circular(30)),
                        hintStyle: GoogleFonts.poppins(
                          fontSize: 20,
                        ),

                        focusedBorder: OutlineInputBorder(

                          borderRadius: BorderRadius.circular(45),

                          borderSide: BorderSide(
                            color: HexColor("#C890F9"),
                            width: 2.0,
                          ),
                        )),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Not a member ? ',style: GoogleFonts.poppins(color: Colors.black),),
                  GestureDetector(
                      onTap: () {
                        setState(() {

                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>  SignUpScreen()),);
                        });
                      },
                      child: Text(' Register Now',style: GoogleFonts.poppins(fontWeight: FontWeight.bold,color: HexColor("#7083D9")),)
                  ),
                ],
              ),
              SizedBox(height: 30,),
              Container(

                child: Column(
                  children:[
                GestureDetector(
                  onTap: () {
                  setState(() {

                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  HomePage()),);
                  });},
                    child: Image.asset("assets/forward_filled_arrow.png",scale: 8,)

                ),
                  //Text("Lets go",style: GoogleFonts.poppins(fontWeight: FontWeight.w600),)
                  ],)
              )
            ],
          ),
      ),
    ]),
        ));
  }
}
