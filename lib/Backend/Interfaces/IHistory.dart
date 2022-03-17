import '../../Models/LoanedProductHistory_model.dart';
import '../../Models/PaymentHistory_model.dart';

class IHistory {
  
  Future<List<PaymentHistoryModel>> viewPaymentHistory(String userId) async {
    throw UnimplementedError();
  }

  Future<List<LoanedProductHistoryModel>> viewLoanHistory(String userId) {
    throw UnimplementedError();
  }
}
