import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

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
        padding: EdgeInsets.only(left: 15, right: 15, top: 50),
        child: ListView(  
          children: <Widget>[
            Container(
              child:Padding(
                padding: EdgeInsets.only(right:350, bottom: 30),
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    size: 30,
                  ),
                  onPressed: (){

                  },
                ),
              ),     
            ),

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

            Container(
              margin: const EdgeInsets.only(top: 50),
              child : Text(
                "Settings", 
                style: TextStyle(color: HexColor("#155293"), fontFamily: 'Cairo_Bold', fontSize: 25),
              ),
            ),
    
            ExpansionTile(          
              textColor: HexColor("#EA1C24"),
              iconColor: HexColor("#155293"),        
              leading: Padding(
                padding: EdgeInsets.only(left:5),
                child: Icon (Icons.groups),
              ),
              title: Text(
                "Served Borrowers",         
                style: TextStyle(   
                  fontSize: 17,                
                  fontFamily: 'Cairo_SemiBold'
                ),
              ),
              children: <Widget>[       
                ListTile(      
                  tileColor: Colors.white,      
                  leading: Padding(
                    padding: EdgeInsets.only(left:25, right: 5),
                    child: Icon (Icons.remove_red_eye),
                 ),
                  title: Text(
                    'View Served Borrowers',                   
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'Cairo_SemiBold'
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
              textColor: HexColor("#EA1C24"),
              iconColor: HexColor("#155293"),       
              leading: Padding(
                padding: EdgeInsets.only(left:5),
                child: Icon (Icons.settings),
              ),
              title: Text(
                "Account",
                style: TextStyle(
                  fontSize: 17,
                  fontFamily: 'Cairo_SemiBold'
                ),
              ),
              children: <Widget>[           
                ListTile(
                  leading: Padding(
                    padding: EdgeInsets.only(left:25, right:5),
                    child: Icon (Icons.person),
                 ),
                  title: Text(
                    'View Profile',                   
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'Cairo_SemiBold'
                    ),
                  ),
                  onTap: () { 
                    showDialog(context: context,
                    builder: (BuildContext context) {
                      return MyProfile();
                    });
              },),
                ListTile(           
                  leading: Padding(
                    padding: EdgeInsets.only(left:25, right:5),
                    child: Icon (Icons.logout),
                  ),
                  title: Text(
                    'Logout',
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'Cairo_SemiBold'                     
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

