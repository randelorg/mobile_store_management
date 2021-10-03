import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp( 
      home: Scaffold(
        backgroundColor: Colors.white, 
        body: Center(
          child: Column(   
            children: <Widget>[                  
              Container(    
                margin: const EdgeInsets.only(top: 145),
                child: Text(
                  "COLLECTED AMOUNT",            
                  style: TextStyle( 
                    color: Colors.black,
                    fontSize: 15,
                    fontFamily: 'Cairo_SemiBold'),
                    textAlign: TextAlign.center,
                  ),
              ),

              Container(   
                height: 65, width: 245,             
                child:Card(
                  elevation: 2,  
                  shape:RoundedRectangleBorder(             
                    borderRadius: const BorderRadius.all(const Radius.circular(80)),
                  ),
                  color: HexColor("#EA1C24"),      
                  child: Row (     
                    children: [      
                      Padding(       
                        padding: EdgeInsets.only(left: 25, right: 10),
                        child: Text('₱',
                        textAlign: TextAlign.center,
                         style: TextStyle(     
                           color: Colors.white,
                           fontSize: 25,                            
                           fontWeight: FontWeight.w600,        
                         ))),
                        Text('60 000',              
                        textAlign: TextAlign.center,
                        softWrap: true,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Cairo_SemiBold',
                          fontSize: 25,                                 
                        ))]),
                        margin: EdgeInsets.only(left: 40, right: 40), 
                )),
            ]))),
    );
  }
}
                        
        


        