import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class MyProfile extends StatefulWidget {
  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        insetPadding: EdgeInsets.only(left: 20, right: 20, top: 180, bottom: 200),
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
                    margin: const EdgeInsets.only(top: 150, bottom: 2, right: 225),    
                    child: Text(
                      "My Profile",                  
                      style: TextStyle(
                        color: HexColor("#155293"),
                        fontFamily: 'Cairo_Bold',
                        fontSize: 25),
                    ),
                  ),
              
                  // Display Collector ID
                  Card(
                    elevation: 3,
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 40, right: 57),
                          child: Text('Collector ID',                 
                          style: TextStyle(                           
                            color: Colors.grey[700],
                            fontFamily: 'Cairo_SemiBold',
                            fontSize: 12,
                          ))),
                          Text('1234',
                          softWrap: true,                      
                          style: TextStyle(                    
                            fontSize: 14, fontFamily: 'Cairo_SemiBold')),
                      ],
                    ),
                  ),
                 
                  // Display Full Name
                  Card(
                    elevation: 3,
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 40, right: 65),
                          child: Text('Full Name',
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontFamily: 'Cairo_SemiBold',
                            fontSize: 12,
                          ))),
                          Text('Randel Reyes',
                          softWrap: true,
                          style: TextStyle(
                            fontSize: 14, fontFamily: 'Cairo_SemiBold')),
                      ],
                    ),
                  ),
                       
                  // Display Mobile Number
                  Card(
                    elevation: 3,
                    child: Row(
                      children: [
                        Padding(                      
                          padding: EdgeInsets.only(left: 40, right: 39),
                          child: Text('Mobile Number',
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontFamily: 'Cairo_SemiBold',
                            fontSize: 12,
                          ))),
                          Text('09696969691',
                          softWrap: true,
                          style: TextStyle(
                            fontSize: 14, fontFamily: 'Cairo_SemiBold')),
                      ],
                    ),
                  ),
                      
                  // Display Home Address
                  Card(
                    elevation: 3,
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 40, right: 41),
                          child: Text('Home Address',
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontFamily: 'Cairo_SemiBold',
                            fontSize: 12,
                          ))), 
                          Text('Mabolo, Naga City',
                          softWrap: true,
                          style: TextStyle(
                           fontSize: 14, fontFamily: 'Cairo_SemiBold')),
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
                backgroundColor: Colors.redAccent,
                radius: 70,
                //child: ClipOval(child: Image.asset('assets/images/login-logo.jpg', height: 150, width: 150, fit: BoxFit.cover,),),
              )),
          ],
        ));
  }
}