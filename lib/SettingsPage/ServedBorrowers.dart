import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:data_table_2/data_table_2.dart';

class ServedBorrowers extends StatefulWidget {
  @override
  _ServedBorrowersState createState() => _ServedBorrowersState();
}

class _ServedBorrowersState extends State<ServedBorrowers> {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp( 
      home: Scaffold(    
        backgroundColor: Colors.white,
        body:Column(
          children:<Widget>[
            Container(
              margin: const EdgeInsets.only(top: 100),
              child:Row(                       
                children: [            
                  Padding(
                    padding: EdgeInsets.only(left: 25, right: 30),
                    child: IconButton(    
                      icon: Icon(                                
                        Icons.arrow_back,
                        size: 30,
                        
                      ),
                      onPressed: () { 
                                   
                      },
                    ),
                  ),
                  Text(         
                    "Served Borrowers",                 
                    style: TextStyle(  
                    fontFamily: 'Cairo_Bold', 
                    color: HexColor("#155293"),                 
                    fontSize: 30,  
                   ),
                  ),
                ],
              ),
            ),
              
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
                      label: Text('BID', textAlign: TextAlign.center,
                      style:TextStyle(fontSize: 12, fontFamily: 'Cairo_SemiBold')),
                    ),
                    DataColumn2(
                       size: ColumnSize.L,                   
                      label: Text('NAME', textAlign: TextAlign.center,
                      style:TextStyle(fontSize: 12, fontFamily: 'Cairo_SemiBold')),
                    ),
                    DataColumn2(
                      size: ColumnSize.S, 
                      label: Text('AMOUNT', textAlign: TextAlign.center,
                      style:TextStyle(fontSize: 12, fontFamily: 'Cairo_SemiBold')),
                    ),
                  ],
                  
                  rows: [
                    DataRow(              
                      cells:[                
                        DataCell(Text('1')),  
                        DataCell(Text('Randel Reyes')),  
                        DataCell(Text('₱ 60,000')), 
                    ]),
                    DataRow(
                      cells:[                
                        DataCell(Text('2')),  
                        DataCell(Text('Michael Jude Jacinto')),  
                        DataCell(Text('₱ 90,000')), 
                    ]),
                    DataRow(
                      cells:[                
                        DataCell(Text('3')),  
                        DataCell(Text('John Vincent Aborde')),  
                        DataCell(Text('₱ 40,000')), 
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
     
 