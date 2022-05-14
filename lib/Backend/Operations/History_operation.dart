import 'package:mobile_store_management/Backend/Interfaces/IHistory.dart';
import 'package:mobile_store_management/Backend/Utility/Mapping.dart';
import 'package:mobile_store_management/Environment/Environment.dart';
import 'package:mobile_store_management/Models/LoanedProductHistory_model.dart';
import 'package:mobile_store_management/Models/PaymentHistory_model.dart';
import 'dart:convert';

class HistoryOperation implements IHistory {
  //Get Loan History
  @override
  Future<List<LoanedProductHistoryModel>> viewLoanHistory(
      String borrowerId) async {
    if (borrowerId == "") return [];
    var response;
    try {
      await Environment.methodGet(
              "${Environment.apiUrl}/api/loanedproducts/$borrowerId")
          .then((value) {
        response = value;
      });

      final parsed =
          await jsonDecode(response.body).cast<Map<String, dynamic>>();
      Mapping.productHistoryList = parsed
          .map<LoanedProductHistoryModel>(
              (json) => LoanedProductHistoryModel.fromJson(json))
          .toList();

      if (response.statusCode == 404) {
        return [];
      }
    } catch (e) {
      print(e.toString());
      return [];
    }
    return Mapping.productHistoryList;
  }

  //Get Payment History
  @override
  Future<List<PaymentHistoryModel>> viewPaymentHistory(
      String borrowerId) async {
    if (borrowerId == "") return [];
     var response;
    try {
      await Environment.methodGet(
              "${Environment.apiUrl}/api/payment/$borrowerId")
          .then((value) {
        response = value;
      });
      
      final parsed =
          await jsonDecode(response.body).cast<Map<String, dynamic>>();
      Mapping.paymentList = parsed
          .map<PaymentHistoryModel>(
              (json) => PaymentHistoryModel.fromJson(json))
          .toList();

      if (response.statusCode == 404) {
        return [];
      }
    } catch (e) {
      print(e.toString());
      return [];
    }
    return Mapping.paymentList;
  }
}
