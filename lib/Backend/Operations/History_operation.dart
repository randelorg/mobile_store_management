import 'package:mobile_store_management/Backend/Interfaces/IHistory.dart';
import 'package:mobile_store_management/Backend/Utility/Mapping.dart';
import 'package:mobile_store_management/Models/LoanedProductHistory_model.dart';
import 'package:mobile_store_management/Models/PaymentHistory_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HistoryOperation implements IHistory {

  //Get Loan History
  @override
  Future<bool> viewLoanHistory(String borrowerId) async {
    if (borrowerId == "") return false;
    try {
      final response = await http.get(Uri.parse(
          'https://dellrainapi.herokuapp.com/api/loanedproducts/' +
              borrowerId));

      if (response.statusCode == 404) {
        return false;
      }

      final parsed =
          await jsonDecode(response.body).cast<Map<String, dynamic>>();
      Mapping.productHistoryList = parsed
          .map<LoanedProductHistoryModel>(
              (json) => LoanedProductHistoryModel.fromJson(json))
          .toList();

      return true;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  //Get Payment History
  @override
  Future<bool> viewPaymentHistory(String borrowerId) async {
    if (borrowerId == "") return false;
    try {
      final response = await http.get(Uri.parse(
          'https://dellrainapi.herokuapp.com/api/payment/' + borrowerId));

      if (response.statusCode == 404) {
        return false;
      }

      final parsed =
          await jsonDecode(response.body).cast<Map<String, dynamic>>();
      Mapping.paymentList = parsed
          .map<PaymentHistoryModel>(
              (json) => PaymentHistoryModel.fromJson(json))
          .toList();

      return true;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }
}
