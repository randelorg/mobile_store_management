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
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      insetPadding: EdgeInsets.only(left: 20, right: 20, top: 180, bottom: 200),
      child: Stack(
        alignment: Alignment.topCenter, 
        children: [  
          Container(        
            child: Column(  
              children: [          
                // Close Button                
                Align(           
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: Icon(
                      Icons.cancel,
                      size: 30,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),

               // Display Page Title
               Container(   
                 margin: const EdgeInsets.only(left: 4, top: 20),
                 child:Text(                                
                   "Served Borrowers",        
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
                     minWidth: 360,
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
                           DataCell(Text('60 000')),
                         ]),
                        DataRow(                         
                          cells:[
                            DataCell(Text('2')),
                            DataCell(Text('Michael Jude Jacinto')),  
                            DataCell(Text('90 000')),
                          ]),
                        DataRow(                        
                          cells:[                         
                            DataCell(Text('3')),  
                            DataCell(Text('John Vincent Aborde')),  
                            DataCell(Text('40 000')),
                          ]),
                     ],
                   ),
                 ),
               ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}  
                            