import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


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
            height: 330,
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
                       style: TextStyle(color: Colors.blue, fontSize: 25, fontWeight: FontWeight.w800), 
                    ),
                  ),

                  Row(            
                      children: [                    
                        Padding(
                          padding: EdgeInsets.only(left: 30, right: 60),
                          child: Text(                         
                            'Collector ID',                      
                            softWrap: true,
                            style: TextStyle(                             
                              fontSize: 12,                             
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(                       
                            '1234',
                             softWrap: true,                            
                             style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                   ),

                   Row(            
                      children: [                    
                        Padding(
                          padding: EdgeInsets.only(left: 30, right: 70),
                          child: Text(                         
                            'Full Name',                      
                            softWrap: true,
                            style: TextStyle(                             
                              fontSize: 12,                             
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(                       
                            'Randel Reyes',
                             softWrap: true,                            
                             style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                   ),

                   Row(            
                      children: [                    
                        Padding(
                          padding: EdgeInsets.only(left: 30, right: 39),
                          child: Text(                         
                            'Mobile Number',                      
                            softWrap: true,
                            style: TextStyle(                             
                              fontSize: 12,                             
                            ),
                          ),
                        ),
                        Expanded(                     
                          child: Text(                                         
                            '09696969691',
                             softWrap: true,                            
                             style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                   ),

                   Row(            
                      children: [                    
                        Padding(
                          padding: EdgeInsets.only(left: 30, right: 41),
                          child: Text(                         
                            'Home Address',                      
                            softWrap: true,
                            style: TextStyle(                             
                              fontSize: 12,                             
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(                       
                            'Mabolo, Naga City',
                             softWrap: true,                            
                             style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                   ),
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