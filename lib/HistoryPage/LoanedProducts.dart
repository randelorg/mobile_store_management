import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:data_table_2/data_table_2.dart';

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
        body: Column(
          children: <Widget>[
            // Display Page Title
            Container(
              margin: const EdgeInsets.only(left: 40, right:40, top: 100),
              child: Text(    
                "Loaned Products",
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
                  columnSpacing: 5,
                  horizontalMargin: 5,
                  minWidth: 400,
                  columns: [
                    DataColumn2(
                      size: ColumnSize.S,
                      label: Text('PRODID',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 11, fontFamily: 'Cairo_SemiBold')),
                    ),
                    DataColumn2(
                      size: ColumnSize.L,
                      label: Text('PRODUCT NAME',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 11, fontFamily: 'Cairo_SemiBold')),
                    ),
                    DataColumn2(
                      size: ColumnSize.S,
                      label: Text('DATE ADDED',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 11, fontFamily: 'Cairo_SemiBold')),
                    ),
                    DataColumn2(
                      size: ColumnSize.S,
                      label: Text('PAYMENT PLAN',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 11, fontFamily: 'Cairo_SemiBold')),
                    ),
                  ],
              
                  rows: [
                    DataRow(cells: [
                      DataCell(Text('1')),
                      DataCell(Text('Hanabishi Coffee Maker')),
                      DataCell(Text('04/10/21')),
                      DataCell(Text('Daily')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('2')),
                      DataCell(Text('Xiaomi Mi 11')),
                      DataCell(Text('09/10/21')),
                      DataCell(Text('Monthly')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('3')),
                      DataCell(Text('Hanabishi Flat Iron HI84')),
                      DataCell(Text('23/10/21')),
                      DataCell(Text('Daily')),
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
