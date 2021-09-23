import 'package:flutter/material.dart';

import '../MainPage/Home.dart';
import '../PaymentPage/PaymentQR.dart';
import '../PaymentPage/PaymentInput.dart';
import '../HistoryPage/PaymentHistory.dart';
import '../HistoryPage/LoanedProducts.dart';
import '../SettingsPage/Settings.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  int currentTab = 0; // to keep track of active tab index

  final List<Widget> screens = [
    PaymentQR(),
    PaymentInput(),
    PaymentHistory(),
    LoanedProducts(),
    Settings(),
  ]; // to store nested tabs

  Widget currentScreen = Home(); // First View

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Center(
        child: currentScreen,
      ),
      // QR Code Scanner
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.qr_code_scanner),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        hoverColor: Colors.black,

        onPressed: () {
          setState(() {
            currentScreen = PaymentQR(); // if user taps on this QR Scanner tab will be active
            currentTab = 0;
          });    
        }, 
      ),

      // Center
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              // Left Tab
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // Payment
                  MaterialButton(
                    minWidth: 75,
                    onPressed: () {
                      setState(() {
                        currentScreen = PaymentInput(); // if user taps on this payment tab will be active
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
                  // Payment History
                  MaterialButton(
                    minWidth: 75,
                    onPressed: () {
                      setState(() {
                        currentScreen = PaymentHistory(); // if user taps on this payment history tab will be active
                        currentTab = 2;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.history,
                          color: currentTab == 2 ? Colors.red : Colors.black,
                        ),
                      ],
                    ),
                  )
                ],
              ),
              // Right Tab
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // Loaned Products
                  MaterialButton(
                    minWidth: 75,
                    onPressed: () {
                      setState(() {
                        currentScreen = LoanedProducts(); // if user taps on this loaned products tab will be active
                        currentTab = 3;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.shopping_basket,
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
                        currentScreen = Settings(); // if user taps on this settings tab will be active
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
