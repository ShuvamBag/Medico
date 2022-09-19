import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import 'Home Screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

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
                    "SIGN UP",
                    style: GoogleFonts.poppins(
                      fontSize: 40,
                      fontWeight: FontWeight.w700,
                    ),
                    colors: [
                      HexColor("#FF6B90"),
                      HexColor("#8390D9"),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Image.asset("assets/signup.gif"),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                  child: TextField(
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                    ),
                    cursorColor: HexColor("#5269EE"),
                    cursorHeight: 24,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: HexColor("#BCC6F9"),
                        prefixIcon: Icon(Icons.perm_contact_cal_outlined),
                        hintText: "Name",
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(30)),
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
                  padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
                  child: TextField(
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                    ),
                    cursorColor: HexColor("#5269EE"),
                    cursorHeight: 24,
                    controller: emailController,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: HexColor("#FEC4D5"),
                        prefixIcon: Icon(Icons.person),
                        hintText: "Email Address",
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(30)),
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
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                    ),
                    cursorColor: HexColor("#5269EE"),
                    cursorHeight: 24,
                    controller: passwordController,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: HexColor("#F3DFAA"),
                        prefixIcon: Icon(Icons.password_rounded),
                        hintText: "Password",
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(30)),
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
              SizedBox(
                height: 20,
              ),
              Container(
                  child: Column(
                children: [
                  GestureDetector(
                      onTap: () {
                        FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                                email: emailController.text,
                                password: passwordController.text)
                            .then((value) {
                          print("Created New Account");
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()));
                        }).onError((error, stackTrace) {
                          print("Error ${error.toString()}");
                        });
                      },
                      child: Image.asset(
                        "assets/forward_filled_arrow.png",
                        scale: 8,
                      )),
                  //Text("Lets go",style: GoogleFonts.poppins(fontWeight: FontWeight.w600),)
                ],
              ))
            ],
          ),
        ),
      ]),
    ));
  }
}
