import 'package:flutter/material.dart';

class PaymentInput extends StatefulWidget {
  @override
  _PaymentInputState createState() => _PaymentInputState();
}

class _PaymentInputState extends State<PaymentInput> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(child: Text('Payment Test')),
      ),
    );
  }
}
