import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

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
              child: ListView(
                children: <Widget>[
                  




                ],
              ),
            ), 
          ],
        ),
      ),
    );
  }  
}  
     
 