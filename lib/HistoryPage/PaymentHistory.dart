import 'package:flutter/material.dart';

class PaymentHistory extends StatefulWidget {
  @override
  _PaymentHistoryState createState() => _PaymentHistoryState();
}

class _PaymentHistoryState extends State<PaymentHistory> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp( 
        home: Scaffold(     
          body: ListView(children: <Widget>[  
            Container(            
               margin: const EdgeInsets.only(top: 100, bottom: 50),
               child: Text(    
                "Payment History",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 30,
                  fontWeight: FontWeight.w800),
                  textAlign: TextAlign.center,
                ),
              ),
 
            DataTable(  
              columns: [  
                DataColumn(label: Text(  
                    'LOANID',
                    textAlign: TextAlign.center,                             
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500)  
                )),  
                DataColumn(label: Text(  
                    'AMOUNT PAID',
                    textAlign: TextAlign.center,  
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500)  
                )),  
                DataColumn(label: Text(  
                    'DATE',
                    textAlign: TextAlign.center,  
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500)  
                )),  
              ],              
              rows: [  
                DataRow(cells: [  
                  DataCell(Text('1')),  
                  DataCell(Text('₱ 3,000')),  
                  DataCell(Text('20/09/21')),  
                ]),  
                DataRow(cells: [  
                  DataCell(Text('2')),  
                  DataCell(Text('₱ 5,000')),  
                  DataCell(Text('25/09/21')),    
                ]),  
              ],  
            ),  
          ])  
      ),  
    );  
  }  
}  
     
 