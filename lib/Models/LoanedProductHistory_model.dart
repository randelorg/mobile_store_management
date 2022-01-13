import 'package:intl/intl.dart';

class LoanedProductHistoryModel {

  int? loanId;
  String? productName;
  String? dateAdded;
  String? paymentPlan;
 
  get getLoanId => this.loanId;
  set setLoanId(loanId) => this.loanId = loanId;

  get getProductName => this.productName;
  set setProductName(productName) => this.productName = productName;

  get getDateAdded => convertDateTimeDisplay(this.dateAdded.toString());
  set setDateAdded(dateAdded) => this.dateAdded = dateAdded;

  get getPaymentPlan => this.paymentPlan;
  set setPaymentPlan(paymentPlan) => this.paymentPlan = paymentPlan;


  String convertDateTimeDisplay(String date) {
    final DateFormat displayFormater = DateFormat('yyyy-MM-ddTHH:mm:ss.SSS');
    final DateFormat serverFormater = DateFormat('dd-MM-yyyy');
    final DateTime displayDate = displayFormater.parse(date);
    final String formatted = serverFormater.format(displayDate);
    return formatted;
  }

  LoanedProductHistoryModel.empty();

  LoanedProductHistoryModel.full(
      {this.loanId,
      this.productName,
      this.dateAdded,
      this.paymentPlan}) {
    this.loanId = loanId;
    this.productName = productName;
    this.dateAdded = dateAdded;
    this.paymentPlan = paymentPlan;
  }

  factory LoanedProductHistoryModel.fromJson(Map<String, dynamic> json) {
    return LoanedProductHistoryModel.full(
      loanId: json['LoanID'] as int,
      productName: json['ProdName'] as String,
      dateAdded: json['DateAdded'] as String,
      paymentPlan: json['PaymentPlan'] as String
    );
  }
}