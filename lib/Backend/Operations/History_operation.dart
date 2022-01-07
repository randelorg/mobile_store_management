import 'package:mobile_store_management/Backend/Interfaces/IHistory.dart';
import 'package:mobile_store_management/Backend/Utility/Mapping.dart';
import 'package:mobile_store_management/Models/PaymentHistory_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HistoryOperation implements IHistory {
  @override
  Future<int> viewLoanHistory(String borrowerId) async {
    // try {
    //   final response = await http.get(
    //       Uri.parse('http://localhost:8090/api/loanedproducts/' + borrowerId));

    //   final parsed =
    //       await jsonDecode(response.body).cast<Map<String, dynamic>>();
    //   Mapping.productHistoryList = parsed
    //       .map<LoanedProductHistory>(
    //           (json) => LoanedProductHistory.fromJson(json))
    //       .toList();

    //   if (response.statusCode == 404) {
    //     SnackNotification.notif(
    //         'Error', 'Cant fetch loaned product history', Colors.red.shade600);
    //     return -1;
    //   }

    //   return 1;
    // } catch (e) {
    //   print(e.toString());
    //   SnackNotification.notif(
    //       'Error', 'Cant fetch loaned product history', Colors.red.shade600);
    //   return -1;
    // }
    return 1;
  }

  @override
  Future<int> viewPaymentHistory(String borrowerId) async {
    print('borrower id is $borrowerId');
    try {
      final response = await http
          .get(Uri.parse('http://10.0.2.2:8090/api/payment/' + borrowerId));

      if (response.statusCode == 404) {
        return -1;
      }

      final parsed =
          await jsonDecode(response.body).cast<Map<String, dynamic>>();
      Mapping.paymentList = parsed
          .map<PaymentHistoryModel>(
              (json) => PaymentHistoryModel.fromJson(json))
          .toList();

      print(parsed);

      return 1;
    } catch (e) {
      print(e.toString());
      return -1;
    }
  }
}
