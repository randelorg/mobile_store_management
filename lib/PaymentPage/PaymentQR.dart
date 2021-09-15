import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class PaymentQR extends StatefulWidget {
  @override
  _PaymentQRState createState() => _PaymentQRState();
}

class _PaymentQRState extends State<PaymentQR> {
  String qrString = "Not Scanned";



  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
     future: scanQR(),
      builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
       return Container();
      },
    );
  }

  Future<void> scanQR() async {
    try {
      FlutterBarcodeScanner.scanBarcode("#2A99CF", "Cancel", false, ScanMode.QR)
          .then((value) {
        setState(() {
          qrString = value;
        });
      });
    } catch (e) {
      setState(() {
        qrString = "Unable to read the QR";
      });
    }
  }
}
