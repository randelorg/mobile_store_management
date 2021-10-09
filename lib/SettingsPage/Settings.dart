import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../SettingsPage/ServedBorrowers.dart';
import '../SettingsPage/MyProfile.dart';
import '../SettingsPage/Logout.dart';

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
        padding: EdgeInsets.only(left: 15, right: 15, top: 80),
        child: ListView(
          children: <Widget>[
            // Display Profile Picture
            Center(
              child: Stack(
                children: <Widget>[
                  CircleAvatar(
                    backgroundColor: Colors.redAccent,
                    radius: 70,
                    //child: ClipOval(child: Image.asset('assets/images/logo.jpg', height: 150, width: 150, fit: BoxFit.cover,),),
                  ),
                ],
              ),
            ),

            // Display Page Title
            Container(
              margin: const EdgeInsets.only(top: 50),
              child: Text(
                "Settings",
                style: TextStyle(
                    color: HexColor("#155293"),
                    fontFamily: 'Cairo_Bold',
                    fontSize: 25),
              ),
            ),

            // Display Served Borrowers
            ExpansionTile(
              textColor: HexColor("#EA1C24"),
              iconColor: HexColor("#155293"),
              leading: Padding(
                padding: EdgeInsets.only(left: 5),
                child: Icon(Icons.groups),
              ),
              title: Text(
                "Served Borrowers",
                style: TextStyle(fontSize: 17, fontFamily: 'Cairo_SemiBold'),
              ),
              children: <Widget>[
                ListTile(
                  tileColor: Colors.white,
                  leading: Padding(
                    padding: EdgeInsets.only(left: 25, right: 5),
                    child: Icon(Icons.remove_red_eye),
                  ),
                  title: Text(
                    'View Served Borrowers',
                    style:
                        TextStyle(fontSize: 15, fontFamily: 'Cairo_SemiBold'),
                  ),
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {                      
                          return ServedBorrowers();
                        });
                  },
                ),
              ],
            ),

            // Display Account
            ExpansionTile(
              textColor: HexColor("#EA1C24"),
              iconColor: HexColor("#155293"),
              leading: Padding(
                padding: EdgeInsets.only(left: 5),
                child: Icon(Icons.settings),
              ),
              title: Text(
                "Account",
                style: TextStyle(fontSize: 17, fontFamily: 'Cairo_SemiBold'),
              ),
              children: <Widget>[
                ListTile(
                  leading: Padding(
                    padding: EdgeInsets.only(left: 25, right: 5),
                    child: Icon(Icons.person),
                  ),
                  title: Text(
                    'View Profile',
                    style: TextStyle(fontSize: 15, fontFamily: 'Cairo_SemiBold'),               
                  ),
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return MyProfile();
                        });
                  },
                ),
                ListTile(
                  leading: Padding(
                    padding: EdgeInsets.only(left: 25, right: 5),
                    child: Icon(Icons.logout),
                  ),
                  title: Text(
                    'Log Out',
                    style: TextStyle(fontSize: 15, fontFamily: 'Cairo_SemiBold'),
                  ),
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Logout();
                        });
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

