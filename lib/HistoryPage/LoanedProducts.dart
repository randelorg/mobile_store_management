import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';


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
        body:Column(
          children:<Widget>[
            Container(
              margin: const EdgeInsets.only(top: 100),
              child:Row(                       
                children: [            
                  Padding(
                    padding: EdgeInsets.only(left: 25, right: 35),
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
                    "Loaned Products",                 
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