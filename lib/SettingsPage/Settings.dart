import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../SettingsPage/ServedBorrowers.dart';
import '../SettingsPage/MyProfile.dart';
import '../LoginPage/Login.dart';


class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: EdgeInsets.only(left: 15, right: 15, top: 75),
        child: ListView(  
          children: <Widget>[
            Center(                    
              child: Stack(
                children: <Widget>[
                  CircleAvatar(
                    backgroundColor: Colors.redAccent,               
                    radius: 70,
                    //child: ClipOval(child: Image.asset('assets/images/login-logo.jpg', height: 150, width: 150, fit: BoxFit.cover,),),            
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 50),
              child : Text(
                "Settings",           
                 style: TextStyle(color: Colors.blue, fontSize: 25, fontWeight: FontWeight.w800),
              ),
            ),
            ExpansionTile(
              title: Text(
                "Served Borrowers",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500
                ),
              ),
              children: <Widget>[
                ListTile(
                  title: Text(
                    'View Served Borrowers',                   
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                  onTap: () {                
                    Navigator.push(
                      context, MaterialPageRoute(builder: (_) => ServedBorrowers()));
                  },
                ),
              ],
            ),
            ExpansionTile(
              title: Text(
                "Account",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500
                ), 
              ),    
              children: <Widget>[
                ListTile(
                  title: Text(
                    'View Profile',                   
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                  onTap: () { 
                    showDialog(context: context,
                    builder: (BuildContext context) {
                      return MyProfile();
                    });
              },),
                ListTile(
                  title: Text(
                    'Logout',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context, MaterialPageRoute(builder: (_) => Login()));
                  },             
                )
              ],
            ),
          ],
        ),
      ),
    );
  } 
}

