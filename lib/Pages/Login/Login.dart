import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mobile_store_management/Backend/Operations/Login_operation.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isHidden = true;
  var login = LoginOperation();

  final username = TextEditingController();
  final password = TextEditingController();

  String administrator = 'Administrator';
  String collector = 'Collector';
  String? loginRole;

  @override
  void initState() {
    super.initState();
  }

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
                width: 275,
                height: 250,
                child: Image.asset('assets/images/logo.jpg'),
              ),
            ),
          ),

          // Drop Menu
          Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Container(
              width: 340,
              height: 55,
              decoration: BoxDecoration(
                color: Colors.blueGrey[50],
                borderRadius: BorderRadius.circular(08),
                border: Border.all(
                  color: Colors.red.shade50,
                  style: BorderStyle.solid,
                ),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  isExpanded: true,
                  value: administrator,
                  icon: const Icon(Icons.arrow_drop_down),
                  iconSize: 24,
                  elevation: 16,
                  style: TextStyle(color: Colors.blue.shade700),
                  onChanged: (role) {
                    setState(() {
                      administrator = role!;
                    });
                  },
                  items: <String>['Administrator', 'Collector']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Padding(
                        padding: EdgeInsets.only(left: 25),
                        child: Text(
                          value,
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),

          // Input Username
          Container(
            padding: EdgeInsets.only(left: 35, right: 35),
            child: TextField(
                controller: username,
                decoration: InputDecoration(
                  hintText: 'Username',
                  prefixIcon: Icon(Icons.person_rounded, color: Colors.red),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide(color: Colors.red, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide(color: Colors.black, width: 2),
                  ),
                )),
          ),

          // Input Password
          Container(
            padding: EdgeInsets.only(left: 35, right: 35, top: 10),
            child: TextField(
                controller: password,
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
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide(color: Colors.black, width: 2),
                  ),
                )),
          ),

          // Login Button
          Container(
            margin: EdgeInsets.only(left: 35, right: 35, top: 85),
            height: 60,
            width: 175,
            decoration: BoxDecoration(
                color: HexColor("#EA1C24"),
                borderRadius: BorderRadius.circular(80)),
            child: TextButton(
              child: Text(
                'Login',
                style: TextStyle(
                  fontFamily: 'Cairo_Bold',
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
              onPressed: () {
                login
                    .mainLogin(
                        administrator.toString(), username.text, password.text)
                    .then((value) {
                  setState(() {
                    if (value) {
                      Navigator.pushNamed(context, '/home');
                    } else {
                      print("eror");
                    }
                  });
                });
              },
            ),
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
