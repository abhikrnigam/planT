import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plant/screens/mainScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddADeviceScreen extends StatefulWidget {
  String currentUser;

  AddADeviceScreen({@required this.currentUser});

  @override
  _AddADeviceScreenState createState() => _AddADeviceScreenState();
}

class _AddADeviceScreenState extends State<AddADeviceScreen> {
  bool deviceAdded = false;
  String deviceID;
  String _currentUser;

  void setSharedPrefDeviceAdded() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool('deviceAdded', true);
  }

  void getUser() {
    _currentUser = widget.currentUser;
  }

  void getBool() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    deviceAdded = sharedPreferences.getBool('deviceAdded');
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUser();
    getBool();
  }

  Widget getWidget() {
    if (deviceAdded == true) {
      return Container(
        color: Colors.white,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Text(
              "A Device is already added",
              style: GoogleFonts.fredokaOne(
                color: Colors.green[400],
                fontSize: 30,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ),
      );
    } else {
      return Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 10),
              child: Text(
                "Enter your unique device ID to register the device",
                style: GoogleFonts.fredokaOne(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    color: Colors.green),
              ),
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
                FirebaseFirestore firestore = FirebaseFirestore.instance;
                firestore
                    .collection('users')
                    .doc('$_currentUser')
                    .set({
                      "userID": _currentUser,
                      "deviceID": deviceID,
                    })
                    .then(
                        (value) => {print("The data is uploaded to firestore")}).then((value) => {
                          setSharedPrefDeviceAdded()
                })
                    .then((value) => {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MainScreen()))
                        });
              },
            ),
            Spacer(
              flex: 3,
            ),
          ],
        ),
      );
    }
  }

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
      body: getWidget(),
    );
  }
}
