import 'package:mobile_store_management/Backend/Interfaces/IBorrower.dart';
import 'package:mobile_store_management/Backend/Interfaces/IPay.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_store_management/Backend/Utility/ApiUrl.dart';
import 'package:mobile_store_management/Backend/Utility/Mapping.dart';
import 'dart:convert';

import 'package:mobile_store_management/Models/Borrower_model.dart';

class BorrowerOperation implements IBorrower, IPay {

  //QR Code Scanner
  @override
  Future<bool> getBorrower(String bid) async {
    try {
      final response = await http.get(
        Uri.parse(Url.url + "api/borrower/" + bid),
      );

      //if response is empty return false
      if (response.statusCode == 404) { 
        return false;
      }

      Map<String, dynamic> borrowerMap =
          jsonDecode(response.body)[0] as Map<String, dynamic>;

      var bwr = BorrowerModel.fromJson(borrowerMap);

      Mapping.borrowerList.add(
        BorrowerModel.full(
          bwr.getBorrowerId,
          bwr.getFirstname,
          bwr.getLastname,
          bwr.getMobileNumber,
          bwr.getHomeAddress,
          bwr.getBalance,
        ),
      );
      //print('l' + Mapping.borrowerList.length.toString());
    } catch (e) {
      print(e);
      return false;
    }
    //if status code is 202
    return true;
  }

  //Make Payment
  @override
  Future<bool> makePayment(int id, double payment, String date) async {
    var paymentLoad = json.encode({
      'BorrowerID': id,
      'CollectionAmount': payment,
      'GivenDate': date,
    });

    try {
      final response = await http.post(
        Uri.parse(Url.url + "api/payment"),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        },
        body: paymentLoad,
      );

      if (response.statusCode == 404) return false;
    } catch (e) {
      e.toString();
      return false;
    }
    //if status code is 202
    return true;
  }

  //Search Borrowers Name
  @override
  Future<bool> getBorrowerName(String firstname, String lastname) async {
    if (firstname == ' ' && lastname == '') return false;

    var brw = json.encode({
      'firstname': firstname,
      'lastname': lastname,
    });
    try {
      final response = await http.post(
        Uri.parse(Url.url + "api/borrower"),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        },
        body: brw,
      );

      //if response is empty return false
      if (response.statusCode == 404) {
        return false;
      }

      Map<String, dynamic> borrowerMap =
          jsonDecode(response.body)[0] as Map<String, dynamic>;

      var bwr = BorrowerModel.fromJson(borrowerMap);

      Mapping.borrowerList.add(
        BorrowerModel.full(
          bwr.getBorrowerId,
          bwr.getFirstname,
          bwr.getLastname,
          bwr.getMobileNumber,
          bwr.getHomeAddress,
          bwr.getBalance,
        ),
      );
    } catch (e) {
      print(e);
      return false;
    }
    //if status code is 202
    return true;
  }
}
