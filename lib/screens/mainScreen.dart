import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'AddADeviceScreen.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class MainScreen extends StatefulWidget {
  String currentUser = FirebaseAuth.instance.currentUser.email;

  // ignore: non_constant_identifier_names

  MainScreen({@required this.currentUser});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool waterFilled = false;
  String _currentUser;
  bool valveOpened;
  String valveOpenedRaw;

  // ignore: non_constant_identifier_names
  String device_type = '';
  int waterNeededRaw;
  bool waterNeeded;

  // ignore: non_constant_identifier_names
  String device_id = '';

  void getUser() {
    _currentUser = widget.currentUser;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUser();
    getResponse();
    getUserInfo();
  }

  void getUserInfo() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    bool deviceRegistered = sharedPreferences.getBool('deviceAdded');
    if (deviceRegistered == null) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => AddADeviceScreen()));
    }
  }

  void refillWater() async {
    Alert(
      context: context,
      type: AlertType.error,
      title: "Water Refilling",
      desc: "Water will be refilled in 5-10 seconds",
      buttons: [
        DialogButton(
          child: Text(
            "OK",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          width: 120,
        )
      ],
    ).show();
    http.Response response =
        await http.get('http://192.168.0.101/openValveConst/');
    if (response != null) {
      valveOpenedRaw = (jsonDecode(response.body)['device_type']).toString();
      valveOpened = valveOpenedRaw == 'True' ? true : false;
      if (valveOpened) {
        setState(() {});
      }
    }
  }

  Future<void> getResponse() async {
    http.Response response = await http.get('http://192.168.0.101/getData/');
    if (response != null) {
      device_type = (jsonDecode(response.body)['device_type']).toString();
      waterNeededRaw =
          int.parse((jsonDecode(response.body)['waterNeeded']).toString());
      waterNeeded = waterNeededRaw == 1 ? true : false;
      device_id = (jsonDecode(response.body)['device_id']).toString();
      waterFilled = true;
      setState(() {});
    }
  }

  Widget getSecondaryWidget() {
    if (waterNeeded) {
      return Padding(
        padding: const EdgeInsets.only(top: 60.0, bottom: 10.0, left: 45),
        child: CircularPercentIndicator(
          radius: 300.0,
          lineWidth: 40.0,
          animation: true,
          animationDuration: 1500,
          percent: 0.12,
          center: new Text(
            "Low Moisture",
            style: GoogleFonts.fredokaOne(
              color: Colors.grey[700],
              fontSize: 30,
              fontWeight: FontWeight.w400,
            ),
          ),
          footer: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: new Text("Current Soil Moisture",
                style: GoogleFonts.fredokaOne(
                  color: Colors.grey[700],
                  fontSize: 25,
                )),
          ),
          circularStrokeCap: CircularStrokeCap.round,
          progressColor: Colors.red,
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.only(top: 70.0, bottom: 10.0, left: 60),
        child: CircularPercentIndicator(
          radius: 260.0,
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
            padding: const EdgeInsets.only(top: 30.0),
            child: new Text("Current Soil Moisture",
                style: GoogleFonts.fredokaOne(
                  color: Colors.grey[700],
                  fontSize: 25,
                )),
          ),
          circularStrokeCap: CircularStrokeCap.round,
          progressColor: Colors.green,
        ),
      );
    }
  }

  Widget getWidget() {
    if (device_type != '' && device_id != '') {
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
            children: <Widget>[
              Column(
                children: <Widget>[
                  device_id!=null?Padding(
                    padding: const EdgeInsets.only(bottom:8.0,top:20),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Device ID: $device_id",style: GoogleFonts.fredokaOne(
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                          color: Colors.grey[700],
                        ),),
                      ),
                    ),
                  ):Container(),
                  device_id!=null?Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("User ID: $_currentUser",style: GoogleFonts.fredokaOne(
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                          color: Colors.grey[700],
                        ),),
                      ),
                    ),
                  ):Container(),
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
                            height: 370,
                          ),
                        ),
                      ),
                      getSecondaryWidget(),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 15.0, left: 10, bottom: 10, right: 70),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(50)),
                                child: IconButton(
                                  highlightColor: Colors.white,
                                  iconSize: 40,
                                  color: Colors.green,
                                  icon: Icon(Icons.refresh),
                                  onPressed: () {
                                    getResponse();
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 15.0, right: 10, bottom: 10, left: 20),
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
                                  icon: Icon(Icons.settings_input_antenna),
                                  onPressed: () async {
                                    refillWater();
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 15.0, right: 10, bottom: 10, left: 70),
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
                                                AddADeviceScreen(
                                                    currentUser: _currentUser)));
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    } else
      return Center(
        child: Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SpinKitWanderingCubes(
                duration: Duration(milliseconds: 500),
                color: Colors.green,
              ),
              Material(
                child: Text(
                  "Getting your data....",
                  style: GoogleFonts.fredokaOne(
                    color: Colors.black,
                    fontSize: 25,
                  ),
                ),
              )
            ],
          ),
        ),
      );
  }

  Widget getRefillButton() {
    if (!waterFilled) {
      return Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(50)),
        child: IconButton(
          highlightColor: Colors.white,
          iconSize: 40,
          color: Colors.green,
          icon: Icon(Icons.settings_input_antenna),
          onPressed: () async {
            refillWater();
          },
        ),
      );
    } else {
      return Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(50)),
        child: IconButton(
          highlightColor: Colors.white,
          iconSize: 40,
          color: Colors.green,
          icon: Icon(Icons.cancel),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        AddADeviceScreen(currentUser: _currentUser)));
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: getWidget(),
    );
  }
}
