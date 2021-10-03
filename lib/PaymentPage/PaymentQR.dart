import 'package:flutter/material.dart';
import 'package:mobile_store_management/LoginPage/Login.dart';
import 'package:mobile_store_management/PaymentPage/MakePayment.dart';
import 'package:qr_code_dart_scan/qr_code_dart_scan.dart';

class PaymentQR extends StatefulWidget {
  @override
  _PaymentQRState createState() => _PaymentQRState();
}

class _PaymentQRState extends State<PaymentQR> {
  Result? currentResult;

  @override
  Widget build(BuildContext context) {
    return Scaffold(   
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Column(
            children: <Widget>[
              Expanded(
                flex: 5,
                child: Stack(
                  children: [
                    QRCodeDartScanView(
                      scanInvertedQRCode: true,
                      onCapture: (Result result) {
                        setState(() {
                    
                        });
                      },
                    ),
                    Center(
                      child: Container(
                        width: 300,
                        height: 300,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.red,
                            width: 4,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.all(40),
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Text: ${currentResult?.text ?? 'Not found'}'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
