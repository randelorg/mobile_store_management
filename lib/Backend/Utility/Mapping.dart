import 'package:mobile_store_management/Models/Admin_model.dart';
import 'package:mobile_store_management/Models/Borrower_model.dart';
import 'package:mobile_store_management/Models/Collector_model.dart';
import 'package:mobile_store_management/Models/LoanedProductHistory_model.dart';
import 'package:mobile_store_management/Models/PaymentHistory_model.dart';
import 'package:mobile_store_management/Models/ServedBorrowers_model.dart';

class Mapping {
  //for session role
  static String userRole = '';
  static List<CollectorModel> collectorList = [];
  static List<AdminModel> adminList = [];
  static List<ServedBorrowersModel> servedBorrowers = [];
  static List<BorrowerModel> borrowerList = [];
  static List<PaymentHistoryModel> paymentList = [];
  static List<LoanedProductHistoryModel> productHistoryList = [];
}
