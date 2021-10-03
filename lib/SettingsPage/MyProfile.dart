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
    
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20)
      ),
      
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            height: 390,
              child: Column(
                children: [                     
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
                
                  Container(           
                    margin: const EdgeInsets.only(top: 130, bottom: 5, right: 200),
                    child: Text(
                      "My Profile",
                      style: TextStyle(color: HexColor("#155293"), fontFamily: 'Cairo_Bold', fontSize: 25), 
                    ),
                  ),

                  Card(
                    elevation: 2,
                    child: Row ( 
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 30, right: 57),
                          child: Text('Collector ID',
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontFamily: 'Cairo_SemiBold',                        
                            fontSize: 12,   
                          ))),
                          Text('1234',
                          softWrap: true,
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Cairo_SemiBold'
                          )),
                      ],
                    )),

                  Card(
                    elevation: 2,
                    child: Row ( 
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 30, right: 65),
                          child: Text('Full Name',
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontFamily: 'Cairo_SemiBold',
                            fontSize: 12,   
                          ))),
                          Text('Randel Reyes',
                          softWrap: true,
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Cairo_SemiBold'
                          )),
                      ],
                   )),

                   Card(
                    elevation: 2,
                    child: Row ( 
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 30, right: 39),
                          child: Text('Mobile Number',
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontFamily: 'Cairo_SemiBold',
                            fontSize: 12,   
                          ))),
                          Text('09696969691',
                          softWrap: true,
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Cairo_SemiBold'
                          )),
                      ],
                   )),

                   Card(
                    elevation: 2,          
                    child: Row ( 
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 30, right: 41),
                          child: Text('Home Address',
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontFamily: 'Cairo_SemiBold',
                            fontSize: 12,   
                          ))),
                          Text('Mabolo, Naga City',
                          softWrap: true,
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Cairo_SemiBold'
                          )),
                      ],
                   )),
                ],
              ),
          ),

          Positioned(
            top: 35,
            child: CircleAvatar(
              backgroundColor: Colors.redAccent,
              radius: 70,
              //child: ClipOval(child: Image.asset('assets/images/login-logo.jpg', height: 150, width: 150, fit: BoxFit.cover,),),            
            )
          ),
        ],
      )
    );
  }
}