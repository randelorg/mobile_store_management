import 'package:flutter/material.dart';

class LoanedProducts extends StatefulWidget {
  @override
  _LoanedProductsState createState() => _LoanedProductsState();
}

class _LoanedProductsState extends State<LoanedProducts> {
  @override

  Widget build(BuildContext context) {
    return MaterialApp( 
        home: Scaffold(    
          backgroundColor: Colors.white,
          resizeToAvoidBottomInset: false,
          body: Center(         
            child: ListView(children: <Widget>[
             Container(            
               margin: const EdgeInsets.only(top: 100, bottom: 50),
               child: Text(    
                "Loaned Products",
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
                    'PRODID', 
                    textAlign: TextAlign.center, 
                    style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500)  
                )),  
                DataColumn(label: Text(  
                    'PRODUCT\nNAME',  
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500)  
                )),  
                DataColumn(label: Text(  
                    'DATE\nADDED', 
                    textAlign: TextAlign.center, 
                    style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500)  
                )),  
                DataColumn(label: Text(  
                    'PAYMENT\nPLAN',  
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500)  
                )), 
              ],  
              rows: [  
                DataRow(cells: [  
                  DataCell(Text('1')),  
                  DataCell(Text('Hanabishi Coffee Maker')),  
                  DataCell(Text('31/03/21')), 
                  DataCell(Text('Daily')), 
                ]),  
                DataRow(cells: [  
                  DataCell(Text('2')),  
                  DataCell(Text('Camel Air Circulator Fan')),  
                  DataCell(Text('25/06/21')), 
                  DataCell(Text('Monthly')),  
                ]),
              ],  
            ), 
          ]))),
    );
  }
}
        