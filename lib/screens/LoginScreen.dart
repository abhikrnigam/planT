import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  FirebaseAuth user=FirebaseAuth.instance;
  String username;
  String deviceID;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 70.0, bottom: 40,right:100),
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
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0,horizontal: 30),
              child: Material(
                child: TextField(
                  textAlign: TextAlign.center,
                  autofocus: true,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  onChanged: (value) {
                    username = value;
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    hintText: 'Enter your username',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0,horizontal: 30),
              child: Material(
                child: TextField(
                  textAlign: TextAlign.center,
                  autofocus: true,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  onChanged: (value) {
                    deviceID = value;
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    hintText: 'Enter your unique device ID',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
            FlatButton(
              color: Colors.white,
              child: Text(
                "Login",
                style: GoogleFonts.fredokaOne(
                    color: Colors.green,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              onPressed: () async {
                if (username == null && deviceID == null) {
                  print("All fields must be filled");
                } else {
                  if (user != null) {
                    user
                        .createUserWithEmailAndPassword(
                        email: username, password: deviceID)
                        .then((value) => {
                      print(
                          "The user is created with username $username and device id=$deviceID")
                    }).then((value) => {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()))
                    });
                  } else {
                    print("Some error occurred. Please try again.");
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
