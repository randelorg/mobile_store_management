import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp( 
      home: Scaffold(
          backgroundColor: Colors.white,        
          body: Center(     
            child: Column(children: <Widget>[      
            Container(
              margin: const EdgeInsets.only(top: 130),
              child: Text(              
                "COLLECTED AMOUNT",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
              ),
            ),
            
            Container( 
              child: Text(        
                "60,000",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
              ),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: const BorderRadius.all(const Radius.circular(80))
                ),
                padding: EdgeInsets.only(left: 40, right: 40, top: 15, bottom: 15),
            ),
          ]))),
    );
  }
}
