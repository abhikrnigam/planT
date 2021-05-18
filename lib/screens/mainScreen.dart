import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';


class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
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
        child: Column(
          children: <Widget>[
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
                      percent: 0.60,
                      center: new Text(
                        "70 %",
                        style: GoogleFonts.fredokaOne(
                          color: Colors.grey[700],
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
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
//            Padding(
//              padding: const EdgeInsets.only(top:20.0,bottom: 10.0),
//              child: CircularPercentIndicator(
//                radius: 250.0,
//                lineWidth: 40.0,
//                animation: true,
//                animationDuration: 1500,
//                percent: 0.60,
//                center: new Text(
//                  "70 %",
//                  style:
//                  GoogleFonts.fredokaOne(
//                    color: Colors.white,
//                    fontSize: 30,
//                    fontWeight: FontWeight.bold,
//                  ),
//                ),
//                footer: Padding(
//                  padding: const EdgeInsets.only(top:15.0),
//                  child: new Text(
//                    "Current Soil Moisture",
//                    style:
//                    GoogleFonts.fredokaOne(
//                      color: Colors.white,
//                      fontSize: 25,
//                    )
//                  ),
//                ),
//                circularStrokeCap: CircularStrokeCap.round,
//                progressColor: Colors.white,
//              ),
//            ),
          ],
        ),
      ),
    );
  }
}
