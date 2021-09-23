import 'package:flutter/material.dart';

import '../MainPage/MainPage.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isHidden = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 75),
              child: Center(
                child: Container(
                    margin: EdgeInsets.only(bottom: 50),
                    width: 275,
                    height: 250,
                    child: Image.asset('assets/images/login-logo.jpg')),
              ),
            ),
            // Input Username
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 35),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Username',
                ),
              ),
            ),
             // Input Password
            Padding(
              padding: EdgeInsets.only(left: 35, right: 35, top: 15, bottom: 0),
              child: TextField(
                obscureText: _isHidden,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Password',
                    suffix: InkWell(
                      onTap: _togglePasswordView,
                      child: Icon( Icons.visibility),
                  ),
                ),
              ),
            ),
            // Login Button
            Container(
              margin: EdgeInsets.all(75),
              height: 50,
              width: 175,
              decoration: BoxDecoration(
                  color: Colors.red.shade400, 
                  borderRadius: BorderRadius.circular(20)
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => MainPage())); //this is how we ascend to the next page
                },
                child: Text(                
                  'Login',
                  style: TextStyle(
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
      ),
    );
  }

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
}