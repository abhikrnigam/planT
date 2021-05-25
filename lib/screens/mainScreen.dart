//import 'package:firebase/firebase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'AddADeviceScreen.dart';
import 'package:http/http.dart' as http;

class MainScreen extends StatefulWidget {
  String currentUser=FirebaseAuth.instance.currentUser.email;

  MainScreen({@required this.currentUser});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  dynamic response;
  String _currentUser;

  void getUser() {
    _currentUser = widget.currentUser;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUser();
  }

  Future<void> getResponse() async{
    response=await http.get('');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Text(
            "planT",
            style: GoogleFonts.fredokaOne(
              color: Colors.green,
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 15.0, right: 30, bottom: 10),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50)),
                      child: IconButton(
                        highlightColor: Colors.white,
                        iconSize: 40,
                        color: Colors.green,
                        icon: Icon(Icons.add),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      AddADeviceScreen(currentUser:_currentUser)));
                        },
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Text(
                    "Add Device",
                    style: GoogleFonts.fredokaOne(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Stack(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 40.0),
                    child: Center(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(40)),
                        width: 350,
                        height: 350,
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 60.0, bottom: 10.0),
                      child: CircularPercentIndicator(
                        radius: 250.0,
                        lineWidth: 40.0,
                        animation: true,
                        animationDuration: 1500,
                        percent: 0.85,
                        center: new Text(
                          "Sufficient",
                          style: GoogleFonts.fredokaOne(
                            color: Colors.grey[700],
                            fontSize: 30,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        footer: Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: new Text("Current Soil Moisture",
                              style: GoogleFonts.fredokaOne(
                                color: Colors.grey[700],
                                fontSize: 25,
                              )),
                        ),
                        circularStrokeCap: CircularStrokeCap.round,
                        progressColor: Colors.green,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
      ],
        ),
      ),
    );
  }
}
