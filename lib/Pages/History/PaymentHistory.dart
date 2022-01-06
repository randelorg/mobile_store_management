import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:data_table_2/data_table_2.dart';

class PaymentHistory extends StatefulWidget {
  @override
  _PaymentHistoryState createState() => _PaymentHistoryState();
}

class _PaymentHistoryState extends State<PaymentHistory> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp( 
      home: Scaffold(    
        backgroundColor: Colors.white,
        body:Column(
          children:<Widget>[     
            // Display Page Title
            Container(
              margin: const EdgeInsets.only(left: 40, right:40, top: 100),
              child:Text(       
                "Payment History",
                style: TextStyle(     
                  fontFamily: 'Cairo_Bold',         
                  color: HexColor("#155293"),
                  fontSize: 30,
                ),
              ),
            ),

            // Display Data Table
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(5),
                child: DataTable2(      
                  columnSpacing: 30,
                  horizontalMargin: 15,
                  minWidth: 380,
                  columns: [
                    DataColumn2(
                      size: ColumnSize.S,
                      label: Text('LOANID', textAlign: TextAlign.center,
                      style:TextStyle(fontSize: 12, fontFamily: 'Cairo_SemiBold')),
                    ),
                    DataColumn2(
                       size: ColumnSize.M,                   
                      label: Text('AMOUNT PAID', textAlign: TextAlign.center,
                      style:TextStyle(fontSize: 12, fontFamily: 'Cairo_SemiBold')),
                    ),
                    DataColumn2(
                      size: ColumnSize.S, 
                      label: Text('DATE', textAlign: TextAlign.center,
                      style:TextStyle(fontSize: 12, fontFamily: 'Cairo_SemiBold')),
                    ),
                  ],

                  rows: [
                    DataRow(              
                      cells:[                
                        DataCell(Text('1')),  
                        DataCell(Text('₱ 60,000')),  
                        DataCell(Text('04/10/21')), 
                    ]),
                    DataRow(
                      cells:[                
                        DataCell(Text('2')),  
                        DataCell(Text('₱ 40,000')),  
                        DataCell(Text('09/10/21')), 
                    ]),
                    DataRow(
                      cells:[                
                        DataCell(Text('3')),  
                        DataCell(Text('₱ 90,000')),  
                        DataCell(Text('23/10/21')), 
                    ]),
                  ],
                ),
              ),
            ), 
          ],
        ),
      ),
    );
  }  
} 
