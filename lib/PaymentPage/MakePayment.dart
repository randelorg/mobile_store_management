import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class MakePayment extends StatefulWidget {
  @override
  _MakePaymentState createState() => _MakePaymentState();
}

class _MakePaymentState extends State<MakePayment> {

  TextEditingController dateinput = TextEditingController(); 
  
  @override
  void initState() {
    dateinput.text = ""; 
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,

          body: Center(
            child: Column(children: <Widget>[
             Container(            
               margin: const EdgeInsets.only(top: 100, bottom: 50),
               child: Text(    
                "Make Payment",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 30,
                  fontWeight: FontWeight.w800),
                  textAlign: TextAlign.center,
                ),
              ),


              Row( 
                children: [   
                  Padding(
                    padding: EdgeInsets.only(left: 50, right: 60),
                    child: Text(         
                      'Borrowers Name',   
                      softWrap: true,
                      style: TextStyle(
                        fontSize: 12,              
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(  
                      'Michael Jude Jacinto',
                      softWrap: true,  
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        ),
                    ),
                  ),
                ]
              ),

              Row(       
                children: [   
                  Padding(
                    padding: EdgeInsets.only(left: 50, right: 60),
                    child: Text(         
                      'Ampunt to be Paid',   
                      softWrap: true,
                      style: TextStyle(
                        fontSize: 12,              
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(  
                      '100,000',
                      softWrap: true,  
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        ),
                    ),
                  ),
                ]
              ),
      
            // Input Amount Paid
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 35),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(                  
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    hintText: 'Amount Paid',
                ),
              ),
            ),

            // Input Date Today
            Padding(
              padding: EdgeInsets.only(left: 35, right: 35, top: 15, bottom: 50),
              child: TextField(
                controller: dateinput,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    hintText: 'Date Today (',
                ),
                readOnly: true, 
                onTap: () async {          
                  DateTime? pickedDate = await showDatePicker(
                      context: context, initialDate: DateTime.now(),
                      firstDate: DateTime(2021), 
                      lastDate: DateTime(2031)
                  );
                  if(pickedDate != null ){
                      print(pickedDate);  
                      String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate); 
                      print(formattedDate); 
                      setState(() {
                         dateinput.text = formattedDate; 
                      });
                  }else{
                      print("Date is not selected");
                  }
                },
              ),
            ),

            // Pay Button
            Container(
              margin: const EdgeInsets.only(top: 50),
              height: 50,
              width: 150,
              decoration: BoxDecoration(
                  color: Colors.blue, 
                  borderRadius: BorderRadius.circular(25)
              ),
              child: TextButton(
                onPressed: () {
                 
                    
                },
                child: Text(
                  'Pay',
                  style: TextStyle(
                    color: Colors.white, 
                    fontSize: 25,
                  ),
                ),
              ),
            ),
          ]))),
    );
  }
}