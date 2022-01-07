import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mobile_store_management/Backend/Session.dart';
import 'dart:typed_data';

import '../../Backend/Utility/Mapping.dart';

class MyProfile extends StatefulWidget {
  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  List<int> picture = [];
  String? id, role, name, number, address;
  String? whatRole;

  @override
  void initState() {
    super.initState();

    //if user is a collector
    try {
      if (Mapping.userRole  == 'Collector') {
        picture = Mapping.collectorList[0].getUserImage.cast<int>();
        id = Mapping.collectorList[0].getCollectorId;
        role = Mapping.collectorList[0].getRole;
        name = Mapping.collectorList[0].toString();
        number = Mapping.collectorList[0].getMobileNumber;
        address = Mapping.collectorList[0].getHomeAddress;
      } else {
        //if user is admin
        picture = Mapping.adminList[0].getUserImage.cast<int>();
        id = Mapping.adminList[0].getAdminId;
        role = 'Administrator';
        name = Mapping.adminList[0].toString();
        number = Mapping.adminList[0].getMobileNumber;
        address = Mapping.adminList[0].getHomeAddress;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      insetPadding: EdgeInsets.only(left: 20, right: 20, top: 180, bottom: 180),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            child: Column(
              children: [
                // Close Button
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: Icon(
                      Icons.cancel,
                      size: 30,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),

                // Display Page Title
                Container(
                  margin:
                      const EdgeInsets.only(top: 150, bottom: 2, right: 225),
                  child: Text(
                    "My Profile",
                    style: TextStyle(
                        color: HexColor("#155293"),
                        fontFamily: 'Cairo_Bold',
                        fontSize: 25),
                  ),
                ),

                // Display ID
                Card(
                  elevation: 3,
                  shadowColor: Colors.black,
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 40, right: 102),
                        child: Text(
                          'ID',
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontFamily: 'Cairo_SemiBold',
                            fontSize: 12,
                          ),
                        ),
                      ),
                      Text(
                        id.toString(),
                        softWrap: true,
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Cairo_SemiBold',
                        ),
                      ),
                    ],
                  ),
                ),

                // Display Role
                Card(
                  elevation: 3,
                  shadowColor: Colors.black,
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 40, right: 92),
                        child: Text(
                          'Role',
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontFamily: 'Cairo_SemiBold',
                            fontSize: 12,
                          ),
                        ),
                      ),
                      Text(
                        role.toString(),
                        softWrap: true,
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Cairo_SemiBold',
                        ),
                      ),
                    ],
                  ),
                ),

                // Display Full Name
                Card(
                  elevation: 3,
                  shadowColor: Colors.black,
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 40, right: 65),
                        child: Text(
                          'Full Name',
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontFamily: 'Cairo_SemiBold',
                            fontSize: 12,
                          ),
                        ),
                      ),
                      Text(
                        name.toString(),
                        softWrap: true,
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Cairo_SemiBold',
                        ),
                      ),
                    ],
                  ),
                ),

                // Display Mobile Number
                Card(
                  elevation: 3,
                  shadowColor: Colors.black,
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 40, right: 39),
                        child: Text(
                          'Mobile Number',
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontFamily: 'Cairo_SemiBold',
                            fontSize: 12,
                          ),
                        ),
                      ),
                      Text(
                        number.toString(),
                        softWrap: true,
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Cairo_SemiBold',
                        ),
                      ),
                    ],
                  ),
                ),

                // Display Home Address
                Card(
                  elevation: 3,
                  shadowColor: Colors.black,
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 40, right: 41),
                        child: Text(
                          'Home Address',
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontFamily: 'Cairo_SemiBold',
                            fontSize: 12,
                          ),
                        ),
                      ),
                      Text(
                        address.toString(),
                        softWrap: true,
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Cairo_SemiBold',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Display Profile Picture
          Positioned(
            top: 50,
            child: CircleAvatar(
              radius: 70,
              child: ClipOval(
                child: Image.memory(Uint8List.fromList(picture),
                    fit: BoxFit.fill, height: 200, width: 200),
              ),
            ),
          ),
        ],
      ),
    );
  }

  int _whichUser(String role) {
    if (role == 'Collector') {
      return 1;
    }
    //if admin user
    return 0;
  }
}
