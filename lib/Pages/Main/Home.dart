import 'package:flutter/material.dart';
import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:hexcolor/hexcolor.dart';

import '../Payment/MakePayment.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future _scanQR() async {
    ScanResult qrScanResult = await BarcodeScanner.scan();
    String qrResult = qrScanResult.rawContent;

    if (qrResult == "") {
    } else {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => MakePayment(qrResult: qrResult),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext a) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            children: <Widget>[
              // Display Amount Collected Text
              Container(
                margin: const EdgeInsets.only(top: 145),
                child: Text(
                  "COLLECTED AMOUNT",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontFamily: 'Cairo_SemiBold',
                  ),
                ),
              ),

              // Display Amount Collected
              Container(
                height: 65, width: 245,
                child: Card(
                  elevation: 3,
                  shadowColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(80),
                    ),
                  ),
                  color: HexColor("#EA1C24"),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 25, right: 10),
                        child: Text(
                          '₱',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Text(
                        '60 000',
                        textAlign: TextAlign.center,
                        softWrap: true,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Cairo_SemiBold',
                          fontSize: 25,
                        ),
                      ),
                    ],
                  ),
                  margin: EdgeInsets.only(left: 40, right: 40),
                ),
              ),

              // Display Make Payment
              Container(
                margin: const EdgeInsets.only(left: 40, right: 40, top: 230),
                child: Text(
                  "Make Payment",
                  style: TextStyle(
                    fontFamily: 'Cairo_Bold',
                    color: HexColor("#155293"),
                    fontSize: 30,
                  ),
                ),
              ),

              // Display Instruction
              Container(
                margin: const EdgeInsets.only(left: 40, right: 40),
                child: Text(
                  "Find the QR Code of the\nBorrower to Make the Payment",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Cairo_SemiBold',
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
              ),

              // QR Scanner Button
              Container(
                margin: EdgeInsets.only(left: 35, right: 35, top: 6),
                height: 60, width: 175,
                decoration: BoxDecoration(
                    color: HexColor("#155293"),
                    borderRadius: BorderRadius.circular(80)),
                child: TextButton.icon(
                    icon: Icon(
                      Icons.qr_code_scanner,
                      color: Colors.white,
                    ),
                    label: Text('SCAN QR CODE',
                        style: TextStyle(
                          fontFamily: 'Cairo_Bold',
                          color: Colors.white,
                          fontSize: 15,
                        )),
                    onPressed: _scanQR),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
