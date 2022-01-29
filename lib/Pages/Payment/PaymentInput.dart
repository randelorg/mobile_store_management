import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mobile_store_management/Backend/Operations/Borrower_operation.dart';
import 'package:mobile_store_management/Backend/Utility/Mapping.dart';
import 'package:mobile_store_management/Models/ServedBorrowers_model.dart';

class PaymentInput extends StatefulWidget {
  @override
  _PaymentInputState createState() => _PaymentInputState();
}

class _PaymentInputState extends State<PaymentInput> {
  
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController borrowername = TextEditingController();
  final TextEditingController dateinput = TextEditingController();
  final TextEditingController payment = TextEditingController();
  
  var controller = BorrowerOperation();
  late Future borrower;

  @override
  void initState() {
    dateinput.text = "";
    super.initState();
    borrower = controller.getBorrowerName(' ', ' ');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: Form(
          key: _formKey,
          child: Center(
            child: Column(
              children: <Widget>[
                //Display Page Title
                Container(
                  margin: const EdgeInsets.only(left: 40, right: 40, top: 100),
                  child: Text(
                    "Make Payment",
                    style: TextStyle(
                      fontFamily: 'Cairo_Bold',
                      color: HexColor("#155293"),
                      fontSize: 30,
                    ),
                  ),
                ),

                //Input Borrowers Name
                Container(
                  padding: EdgeInsets.only(left: 35, right: 35, top: 50),
                  child: TextFormField(
                    controller: borrowername,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      hintText: 'Borrowers Name',
                      prefixIcon: Icon(Icons.person_rounded, color: Colors.red),
                      suffixIcon: IconButton(
                        iconSize: 25,
                        icon: Icon(Icons.search, color: Colors.grey),
                        onPressed: () {
                          String fullname = borrowername.text.trim();
                          List<String> name = fullname.split(" ");
                          controller
                              .getBorrowerName(name[0], name[1])
                              .then((value) {
                            if (value) {
                              setState(() {
                                borrower = controller.getBorrowerName(
                                    name[0], name[1]);
                              });
                            }
                          });
                        },
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(color: Colors.red, width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(color: Colors.black, width: 2),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "* Required Borrowers Name";
                      }
                    },
                  ),
                ),

                FutureBuilder(
                  future: borrower,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (snapshot.hasData) {
                      if (snapshot.data == true) {
                        return Column(
                          children: [
                            //Display Borrowers Name
                            Container(
                              height: 45,
                              width: 350,
                              child: Card(
                                elevation: 3,
                                shadowColor: Colors.black,
                                child: Row(
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.only(left: 15, right: 30),
                                      child: Text(
                                        'Borrowers Name',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.grey[700],
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      Mapping.borrowerList.last.toString(),
                                      textAlign: TextAlign.center,
                                      softWrap: true,
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'Cairo_SemiBold',
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),

                            //Display Amount to be Paid
                            Container(
                              height: 45,
                              width: 350,
                              child: Card(
                                elevation: 3,
                                shadowColor: Colors.black,
                                child: Row(
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.only(left: 15, right: 3),
                                      child: Text(
                                        'Amount to be Paid        ₱',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.grey[700],
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      Mapping.borrowerList.last.getBalance
                                          .toString(),
                                      textAlign: TextAlign.center,
                                      softWrap: true,
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'Cairo_SemiBold',
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      } else {
                        return Center(
                          child: Text(
                            'No Borrowers Information',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.grey[500],
                              fontFamily: 'Cairo_SemiBold',
                              fontSize: 14,
                            ),
                          ),
                        );
                      }
                    }
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),

                //Input Amount Paid
                Container(
                  padding: EdgeInsets.only(left: 35, right: 35, top: 50),
                  child: TextFormField(
                    controller: payment,
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
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "* Required Amount Paid";
                      }
                    },
                  ),
                ),

                //Input Date Today
                Container(
                  padding:
                      EdgeInsets.only(left: 35, right: 35, top: 15, bottom: 50),
                  child: TextFormField(
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
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "* Required Date Today";
                      }
                    },
                    readOnly: true,
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2022),
                        lastDate: DateTime(2032),
                        builder: (context, child) {
                          return Theme(
                            data: Theme.of(context).copyWith(
                              colorScheme: ColorScheme.light(
                                primary: Colors.red, //Background Color
                                onPrimary: Colors.white, //Text Color
                              ),
                              textButtonTheme: TextButtonThemeData(
                                style: TextButton.styleFrom(
                                  primary: Colors.black, //Button Text Color
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
                            DateFormat('yyyy-MM-dd').format(pickedDate);
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

                //Pay Button
                Container(
                  margin: const EdgeInsets.only(top: 50),
                  height: 60,
                  width: 175,
                  decoration: BoxDecoration(
                      color: HexColor("#155293"),
                      borderRadius: BorderRadius.circular(80)),
                  child: TextButton(
                    child: Text(
                      'Pay',
                      style: TextStyle(
                        fontFamily: 'Cairo_Bold',
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _addToServedBorrowers(
                          Mapping.borrowerList.last.getBorrowerId,
                          Mapping.borrowerList.last.toString(),
                          double.parse(payment.text),
                        );
                        controller
                            .makePayment(
                          Mapping.borrowerList.last.getBorrowerId,
                          double.parse(payment.text),
                          dateinput.text,
                        )
                            .then(
                          (value) {
                            if (value) {
                              print('success');
                              Navigator.pushNamed(context, '/main');
                            }
                          },
                        );
                        return;
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _addToServedBorrowers(int borrowerId, String name, double amount) {
    Mapping.servedBorrowers
        .add(ServedBorrowersModel.full(borrowerId, name, amount));
  }
}
