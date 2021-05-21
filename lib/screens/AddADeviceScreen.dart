import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:firebase_core/firebase_core.dart';
//import 'package:firebase/firestore.dart';

class AddADeviceScreen extends StatefulWidget {
  @override
  _AddADeviceScreenState createState() => _AddADeviceScreenState();
}

class _AddADeviceScreenState extends State<AddADeviceScreen> {
  String deviceID;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "planT",
          style: GoogleFonts.fredokaOne(
              color: Colors.green, fontWeight: FontWeight.bold, fontSize: 40),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:23,vertical: 10),
              child: Text("Enter your unique device ID to register the device",style: GoogleFonts.fredokaOne(
                fontSize: 30,
                fontWeight: FontWeight.w600,
                color: Colors.green
              ),),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 15.0, horizontal: 30),
              child: Material(
                color: Colors.white,
                child: TextField(
                  textAlign: TextAlign.center,
                  autofocus: true,
                  style: TextStyle(
                    fontSize: 20,
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
                  ),
                ),
              ),
            ),
            FlatButton(
              color: Colors.white,
              child: Text(
                "Register Device",
                style: GoogleFonts.fredokaOne(
                    color: Colors.green,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              onPressed: () async {

              },
            ),
            Spacer(flex: 3,),
          ],
        ),
      ),
    );
  }
}
