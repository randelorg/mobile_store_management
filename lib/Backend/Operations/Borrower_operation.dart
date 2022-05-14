import 'package:mobile_store_management/Backend/Interfaces/IBorrower.dart';
import 'package:mobile_store_management/Backend/Interfaces/IPay.dart';
import 'package:mobile_store_management/Backend/Utility/Mapping.dart';
import 'package:mobile_store_management/Environment/Environment.dart';
import 'dart:convert';

import 'package:mobile_store_management/Models/Borrower_model.dart';

class BorrowerOperation implements IBorrower, IPay {
  //QR Code Scanner
  @override
  Future<bool> getBorrower(String bid) async {
    var response;
    try {
      await Environment.methodGet("${Environment.apiUrl}/api/borrower/"+ bid)
          .then((value) {
        response = value;
      });
      
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
    var response;
    var paymentLoad = json.encode({
      'BorrowerID': id,
      'CollectionAmount': payment,
      'GivenDate': date,
    });

    try {
      await Environment.methodPost(
        "${Environment.apiUrl}/api/payment", paymentLoad)
          .then((value) {
        response = value;
      });

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
    if (firstname.isEmpty && lastname.isEmpty) return false;
    var response;
    var brw = json.encode({
      'firstname': firstname,
      'lastname': lastname,
    });
    try {
      await Environment.methodPost("${Environment.apiUrl}/api/borrower", brw)
          .then((value) {
        response = value;
      });

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
