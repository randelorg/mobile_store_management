import 'package:flutter/material.dart';
import 'dart:collection';

import '../Main/Home.dart';
import '../Payment/PaymentInput.dart';
import '../History/PaymentHistory.dart';
import '../History/LoanedProductHistory.dart';
import '../Settings/Settings.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  
  ListQueue<int> navigationQueue = ListQueue();
  int screenIndex = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(   
      //This method will be called on press of the back button
      onWillPop: () async {
        if (navigationQueue.isEmpty) return true;
        setState(() {
          navigationQueue.removeLast();
          int position = navigationQueue.isEmpty ? 0 : navigationQueue.last;
          screenIndex = position;
        });
        return false;
      },

      child: Scaffold(     
        resizeToAvoidBottomInset: false,
        body: (getBody(screenIndex)),
        bottomNavigationBar: BottomNavigationBar(         
          showSelectedLabels: false,
          showUnselectedLabels: false,
          backgroundColor: Colors.white,
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.black,         
          type: BottomNavigationBarType.fixed,   

          currentIndex: this.screenIndex,

          onTap: (value) {   
            navigationQueue.addLast(screenIndex);
            setState(() => screenIndex = value);
            //print(value);
          },

          //Display Bottom Navigation Bar
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.payment), label: 'PaymentInput'),
            BottomNavigationBarItem(icon: Icon(Icons.history), label: 'PaymentHistory'),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_basket), label: 'LoanedProductHistory'),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
          ],
        ),
      ),
    );
  }
  
  Widget getBody(int index) {
    switch (index) {
      case 0:
        return Home(); //Return Home
      case 1:
        return PaymentInput(); //Return Payment Input 
      case 2:
        return PaymentHistory(); //Return Payment History  
      case 3:
        return LoanedProductHistory(); //Return Loaned Product History
      case 4:
      return Settings(); //Return Settings           
    }
    return widget;
  }
}