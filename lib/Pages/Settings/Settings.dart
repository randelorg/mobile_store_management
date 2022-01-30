import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'dart:typed_data';

import '../../Backend/Utility/Mapping.dart';
import '../Settings/ServedBorrowers.dart';
import '../Settings/MyProfile.dart';
import '../Settings/Logout.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  
  List<int> picture = [];
  bool _isEmployee = true;
  String? fullName;
  
  @override
  void initState() {
    super.initState();
    try {
      if (Mapping.userRole == 'Collector') {
        picture = Mapping.collectorList[0].getUserImage.cast<int>();
        fullName = Mapping.collectorList[0].toString();
      } else {
        //if user is admin
        picture = Mapping.adminList[0].getUserImage.cast<int>();
        fullName = Mapping.adminList[0].toString();
        _isEmployee = false;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: EdgeInsets.only(left: 15, right: 15, top: 80),
        child: ListView(
          children: <Widget>[
            //Display Profile Picture
            Center(
              child: Stack(
                children: <Widget>[
                  CircleAvatar(
                      radius: 75,
                      child: ClipOval(
                        child: Image.memory(Uint8List.fromList(picture),
                            fit: BoxFit.fill, height: 250, width: 250),
                      )),
                ],
              ),
            ),

            //Display Fullname
            Container(
              child: Text(
                fullName.toString().toUpperCase(),
                 textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Cairo_Bold',
                    fontSize: 24),
              ),
            ),

            //Display Time-in and Time-out
            Visibility(
              maintainSize: false,
              maintainAnimation: true,
              maintainState: true,
              visible: this._isEmployee,
              child: Container(
                margin: const EdgeInsets.only(left: 75),
                child: Row(
                  children: [               
                    Card(    
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(80),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(right: 7, left: 7),                   
                        child: TextButton.icon(
                         icon: Icon(                     
                           Icons.check_circle,         
                           color: Colors.green,
                         ),
                          label: Text(
                            'Time-in',
                            style: TextStyle(
                              fontFamily: 'Cairo_SemiBold',
                              color: HexColor("#155293"),
                              fontSize: 12,
                            ),
                            softWrap: true,
                          ),
                          onPressed:(){}
                        ),
                      ),
                    ),
                    Card(    
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(80),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(right: 7, left: 7),                   
                        child: TextButton.icon(
                         icon: Icon(                     
                           Icons.cancel,         
                           color: Colors.red,
                         ),
                          label: Text(
                            'Time-out',
                            style: TextStyle(
                              fontFamily: 'Cairo_SemiBold',
                              color: HexColor("#155293"),
                              fontSize: 12,
                            ),
                            softWrap: true,
                          ),
                          onPressed:(){}
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          
            //Display Page Title
            Container(
              margin: const EdgeInsets.only(left: 3, top: 30),
              child: Text(
                "Settings",
                style: TextStyle(
                    color: HexColor("#155293"),
                    fontFamily: 'Cairo_Bold',
                    fontSize: 22),
              ),
            ),

            //Display Served Borrowers
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
                      },
                    );
                  },
                ),
              ],
            ),

            //Display Account
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
                    style:
                        TextStyle(fontSize: 15, fontFamily: 'Cairo_SemiBold'),
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
                    style:
                        TextStyle(fontSize: 15, fontFamily: 'Cairo_SemiBold'),
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
