import 'package:flutter/material.dart';

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
          body: ListView(children: <Widget>[  
            Container(            
               margin: const EdgeInsets.only(top: 100, bottom: 50),
               child: Text(    
                "Served Borrowers",
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
                    'BID', 
                    textAlign: TextAlign.center, 
                    style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500)  
                )),  
                DataColumn(label: Text(  
                    'NAME',  
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500)  
                )),  
                DataColumn(label: Text(  
                    'AMOUNT', 
                    textAlign: TextAlign.center, 
                    style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500)  
                )),                
              ],  
              rows: [  
                DataRow(cells: [  
                  DataCell(Text('1')),  
                  DataCell(Text('Randel Reyes')),  
                  DataCell(Text('₱ 60,000')),         
                ]),  
                DataRow(cells: [  
                  DataCell(Text('2')),  
                  DataCell(Text('Michael Jude Jacinto')),  
                  DataCell(Text('₱ 100,000')),     
                ]), 
                DataRow(cells: [  
                  DataCell(Text('3')),  
                  DataCell(Text('John Vincent Aborde')),  
                  DataCell(Text('₱ 80,000')),     
                ]),             
              ],  
            ),  
          ])  
      ),  
    );  
  }  
}  
     
 