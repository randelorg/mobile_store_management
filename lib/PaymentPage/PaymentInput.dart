import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobile_store_management/MainPage/MainPage.dart';

class PaymentInput extends StatefulWidget {
  @override
  _PaymentInputState createState() => _PaymentInputState();
}

class _PaymentInputState extends State<PaymentInput> {


    TextEditingController dateinput = TextEditingController(); 
  //text editing controller for text field
  
  @override
  void initState() {
    dateinput.text = ""; //set the initial value of text field
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

             // Input Borrowers Name
             Padding(             
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 35),
              child: TextField(    
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Borrowers Name',
                ),
              ),
            ),

          
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                

                children: <Widget>[

                  Container(
                    
                    
                    child: Text(   
                    "Amount to be Paid",  
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w400),
                      textAlign: TextAlign.left,   
                    ),  
                    
                  ),

                  

                  Container(                   
                    child: Text(   
                    "Amount to be Paid",  
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w400),
                      textAlign: TextAlign.left,   
                    )
                  ),  
                  

                ],
                
              ),  
                
               


               
               
             
                  
              
              
            
              
           
            

            // Input Amount Paid
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 35),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
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
                    border: OutlineInputBorder(),
                    hintText: 'Date Today',
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
                  Navigator.push(
                     context, MaterialPageRoute(builder: (_) => MainPage())); //this is how we ascend to the next page
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