import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../Main/BottomNavBar.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  
  bool _isHidden = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(     
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,      
      body: Column(
          children: <Widget>[
            // Display Logo
            Padding(
              padding: const EdgeInsets.only(top: 75),
              child: Center(
                child: Container(
                    margin: EdgeInsets.only(bottom: 50),
                    width: 275, height: 250,
                    child: Image.asset('assets/images/logo.jpg')),
              ),
            ),
            
            // Input Username
            Container(       
	            padding: EdgeInsets.only(left: 35, right: 35),
              child: TextField(      
                decoration: InputDecoration(
                 hintText: 'Username',
	                prefixIcon: Icon(Icons.person_rounded, color: Colors.red),          
	                enabledBorder: OutlineInputBorder(  
		                borderRadius: BorderRadius.all(Radius.circular(8)),
		                borderSide: BorderSide(color: Colors.red, width: 2),
                  ),
                  focusedBorder:  OutlineInputBorder(        
		                borderRadius: BorderRadius.all(Radius.circular(8)),
		                borderSide: BorderSide(color: Colors.black, width: 2),
                  ),
                )),
             ),
             
            // Input Password
            Container(    
	            padding: EdgeInsets.only(left: 35, right: 35, top: 10),
              child: TextField(        
                obscureText: _isHidden,
                decoration: InputDecoration(
                  hintText: 'Password',
	                prefixIcon: Icon(Icons.vpn_key_rounded, color: Colors.red),  
                  suffix: InkWell(
                    onTap: _togglePasswordView,
                    child: Icon(Icons.visibility),
                  ),   
	                enabledBorder: OutlineInputBorder(       
		                borderRadius: BorderRadius.all(Radius.circular(8)),
		                borderSide: BorderSide(color: Colors.red, width: 2),
                  ),  
                  focusedBorder:  OutlineInputBorder(
		                borderRadius: BorderRadius.all(Radius.circular(8)),
		                borderSide: BorderSide(color: Colors.black, width: 2),
                  ),
                )),
             ),
            
            // Login Button
            Container(       
              margin: EdgeInsets.only(left: 35, right: 35, top: 94),
              height: 60, width: 175,         
              decoration: BoxDecoration(         
                color: HexColor("#EA1C24"),
                borderRadius: BorderRadius.circular(80)
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.push(             
                    context, MaterialPageRoute(builder: (_) => BottomNavBar()));
                },
                child: Text(                        
                  'Login',       
                  style: TextStyle(
                    fontFamily: 'Cairo_Bold',
                    color: Colors.white, 
                    fontSize: 25,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 130,
            ),
          ],
        ),
    );
  }

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
}