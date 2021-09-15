import 'package:flutter/material.dart';

import '../MainPage/Home.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentTab = 0; // to keep track of active tab index

  final List<Widget> screens = [
    Home(),
  ]; // to store nested tabs

  Widget currentScreen = Home(); // Our first view in viewport

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: currentScreen,
      ),
      floatingActionButton: FloatingActionButton(

        child: Icon(Icons.qr_code_scanner),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        hoverColor: Colors.black,

        onPressed: () {
          setState(() {
            currentScreen =
                Home(); // if user taps on this dashboard tab will be active
            currentTab = 0;
          });    
        }, 
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MaterialButton(
                    minWidth: 75,
                    onPressed: () {
                      setState(() {
                        currentScreen =
                            Home(); // if user taps on this dashboard tab will be active
                        currentTab = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.payment,
                          color: currentTab == 1 ? Colors.red : Colors.black,
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 75,
                    onPressed: () {
                      setState(() {
                        currentScreen =
                             Home(); // if user taps on this dashboard tab will be active
                        currentTab = 2;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.chat,
                          color: currentTab == 2 ? Colors.red : Colors.black,
                        ),
                      ],
                    ),
                  )
                ],
              ),

              // Right Tab bar icons
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MaterialButton(
                    minWidth: 75,
                    onPressed: () {
                      setState(() {
                        currentScreen =
                            Home(); // if user taps on this dashboard tab will be active
                        currentTab = 3;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.dashboard,
                          color: currentTab == 3 ? Colors.red : Colors.black,
                        ),
                      ],
                    ),
                  ),

                  // Settings
                  MaterialButton(
                    minWidth: 75,
                    onPressed: () {
                      setState(() {
                        currentScreen =
                            Home(); // if user taps on this settings tab will be active
                        currentTab = 4;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.settings,
                          color: currentTab == 4 ? Colors.red : Colors.black,
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
