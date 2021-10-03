import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:hexcolor/hexcolor.dart';

class PaymentInput extends StatefulWidget {
  @override
  _PaymentInputState createState() => _PaymentInputState();
}

class _PaymentInputState extends State<PaymentInput> {
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
              margin: const EdgeInsets.only(top: 100),
              child:Row(                         
                children: [             
                  Padding(         
                    padding: EdgeInsets.only(left: 25, right: 40),
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
                    "Make Payment",                 
                    style: TextStyle(  
                    fontFamily: 'Cairo_Bold', 
                    color: HexColor("#155293"),                 
                    fontSize: 30,  
                   ),
                  ),
                ],
              ),
            ),
        
            // Input Borrowers Name
            Container(         
              padding: EdgeInsets.only(left: 35, right: 35, top: 50),
              child: TextField(
                keyboardType: TextInputType.name,         
                decoration: InputDecoration(         
                  hintText: 'Borrowers Name',
                  prefixIcon: Icon(Icons.person_rounded, color: Colors.red),
                  enabledBorder: OutlineInputBorder(     
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide(color: Colors.red, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide(color: Colors.black, width: 2),
                  ),
                )),
            ),
           
            Container(
                height: 45, width: 350,
                child: Card(
                  elevation: 2,
                  child: Row(children: [
                    Padding(
                        padding: EdgeInsets.only(left: 15, right: 3),
                        child: Text('Amount to be Paid        ₱',
                            textAlign: TextAlign.center,
                            style: TextStyle(                                                    
                              color: Colors.grey[700],
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ))),
                    Text('100 000',
                        textAlign: TextAlign.center,
                        softWrap: true,
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Cairo_SemiBold'
                        ))
                  ]),
                )),

            // Input Amount Paid
            Container(      
              padding: EdgeInsets.only(left: 35, right: 35, top: 50),
              child: TextField(    
                keyboardType: TextInputType.number,     
                decoration: InputDecoration(           
                  hintText: 'Amount Paid',             
                  prefixIcon: Icon(Icons.payment, color: Colors.red),            
                  enabledBorder: OutlineInputBorder(            
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide(color: Colors.red, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide(color: Colors.black, width: 2),
                  ),
                )),
            ), 

            // Input Date Today
            Container(
              padding:EdgeInsets.only(left: 35, right: 35, top: 15, bottom: 50),        
              child: TextField(    
                controller: dateinput,
                keyboardType: TextInputType.datetime,    
                decoration: InputDecoration(
                  hintText: 'Date Today',
                  prefixIcon: Icon(Icons.calendar_today, color: Colors.red),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide(color: Colors.red, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide(color: Colors.black, width: 2),
                  ),
                ),
                readOnly: true,
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2021),
                    lastDate: DateTime(2031),
                    builder: (context, child) {
                      return Theme(
                        data: Theme.of(context).copyWith(
                          colorScheme: ColorScheme.light(
                            primary: Colors.red, // header background color
                            onPrimary: Colors.white, // header text color 
                          ),
                          textButtonTheme: TextButtonThemeData(
                            style: TextButton.styleFrom(                         
                              primary: Colors.black, // button text color
                            ),
                          ),
                        ),
                        child: child!,
                      );
                    },
                  );
                  if (pickedDate != null) {
                    print(pickedDate);
                    String formattedDate =
                        DateFormat('dd-MM-yyyy').format(pickedDate);
                    print(formattedDate);
                    setState(() {
                      dateinput.text = formattedDate;
                    });
                  } else {
                    print("Date is not selected");
                  }
                },
              ),
            ),

            // Pay Button
            Container(        
              margin: const EdgeInsets.only(top: 50),       
              height: 60, width: 175,
              decoration: BoxDecoration(           
                color: HexColor("#155293"),
                borderRadius: BorderRadius.circular(80)),
                child: TextButton(
                  onPressed: () {

                  }, 
                  child: Text(
                   'Pay',
                   style: TextStyle(
                     fontFamily: 'Cairo_Bold',
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