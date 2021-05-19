import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_core/firebase_core.dart';
import 'RegisterScreen.dart';
import 'LoginScreen.dart';
import 'package:google_fonts/google_fonts.dart';

class landingScreen extends StatefulWidget {
  @override
  _landingScreenState createState() => _landingScreenState();
}

class _landingScreenState extends State<landingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
         // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Spacer(flex: 3,),
            Padding(
              padding: const EdgeInsets.only(top: 70.0, bottom: 20),
              child: Material(
                child: Text(
                  "planT",
                  style: GoogleFonts.fredokaOne(
                    fontSize: 70,
                    color: Colors.green,
                  ),
                ),
              ),
            ),
            Spacer(),
            Container(
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(20),
              ),
              child: RawMaterialButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LandingPage()));
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical:15.0,horizontal: 20.0 ),
                  child: Text(
                    "Register",
                    style: GoogleFonts.poppins(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 30),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: RawMaterialButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LandingPage()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical:15.0,horizontal: 20.0 ),
                    child: Text(
                      "Login",
                      style: GoogleFonts.poppins(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Spacer(flex: 6,),
          ],
        )
    );
  }
}
