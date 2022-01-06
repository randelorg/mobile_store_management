import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Pages/Login/Login.dart';
import 'Pages/Main/BottomNavBar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => Login(),
        '/home': (context) => BottomNavBar(),
        '/logout': (context) => Login(),
      },
    );
  }
}
