import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  String username;
  String deviceName;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top:70.0,bottom:40),
            child: Text(
              "planT",
              style: GoogleFonts.fredokaOne(
                color: Colors.green,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical:15.0),
            child: TextField(
              textAlign: TextAlign.center,
              autofocus: true,
              style: TextStyle(
                color: Colors.black,
              ),
              onChanged: (value){
                username=value;
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                hintText: 'Enter your full name',
                hintStyle: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical:15.0),
            child: TextField(
              textAlign: TextAlign.center,
              autofocus: true,
              style: TextStyle(
                color: Colors.black,
              ),
              onChanged: (value){
                deviceName=value;
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                hintText: 'Enter your full name',
                hintStyle: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          FlatButton(
            color: Colors.white,
            child: Text("Register",style: GoogleFonts.fredokaOne(
              color: Colors.green,
              fontSize: 25,
              fontWeight: FontWeight.bold
            ),),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            onPressed: () async{
                  if(username==null && deviceName==null){
                    Scaffold.of(context).showSnackBar(SnackBar(content: Text("All fields must be filled"),)) ;
                  }
                  else{


                  }
            },
          ),
        ],
      ),
    );
  }
}
