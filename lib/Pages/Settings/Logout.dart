import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mobile_store_management/Backend/Operations/Login_operation.dart';

import '../Login/Login.dart';

class Logout extends StatefulWidget {
  @override
  _LogoutState createState() => _LogoutState();
}

class _LogoutState extends State<Logout> {
  var logout = LoginOperation();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      title: Text('Log out', textAlign: TextAlign.center),
      content: Text(
          'You wil be returned to the log in screen. Are you sure you want to log out?',
          textAlign: TextAlign.justify),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(false);
          },
          child: Text(
            'Cancel',
            style: TextStyle(
              color: HexColor("#155293"),
            ),
          ),
        ),
        TextButton(
          child: Text(
            'Log out',
            style: TextStyle(
              color: HexColor("#EA1C24"),
            ),
          ),
          onPressed: () {
            logout.logout();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => Login(),
              ),
            );
          },
        ),
      ],
    );
  }
}
