import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Center(
                child: Container(
                    margin: EdgeInsets.only(bottom: 30),
                    width: 300,
                    height: 250,
                    /*decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50.0)),*/
                    child: Image.asset('assets/images/login-logo.jpg')),
              ),
            ),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 35),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Username',
                ),
              ),
            ),
            Padding(
              // padding: const EdgeInsets.only(
              //     left: 15, right: 15.0, top: 15, bottom: 0
              // ),
              padding: EdgeInsets.only(left: 35, right: 35, top: 15, bottom: 0),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Password',
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(30),
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.red.shade400, 
                  borderRadius: BorderRadius.circular(20)
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => LoginPage())); //this is how we ascend to the next page
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
}