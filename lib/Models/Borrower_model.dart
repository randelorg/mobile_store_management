import 'Person_model.dart';

class BorrowerModel extends PersonModel {
  int? borrowerId;
  dynamic balance;

  get getBorrowerId => this.borrowerId;

  set setBorrowerId(borrowerId) => this.borrowerId = borrowerId;

  get getBalance => this.balance;

  set setBalance(balance) => this.balance = balance;

  BorrowerModel.empty() : super.empty();

  BorrowerModel.full(
    int borrowerId,
    String firstname,
    String lastname,
    String mobileNumber,
    String homeAddress,
    dynamic balance,
  ) : super.withOutId(firstname, lastname, mobileNumber, homeAddress) {
    this.borrowerId = borrowerId;
    this.balance = balance;
  }

  BorrowerModel.fullJson({
    this.borrowerId,
    firstname,
    lastname,
    mobileNumber,
    homeAddress,
    this.balance,
  }) : super.withOutId(firstname, lastname, mobileNumber, homeAddress);

  factory BorrowerModel.fromJson(Map<String, dynamic> json) {
    return BorrowerModel.fullJson(
      borrowerId: json['BorrowerID'] as int,
      firstname: json['Firstname'] as String,
      lastname: json['Lastname'] as String,
      mobileNumber: json['MobileNumber'] as String,
      homeAddress: json['HomeAddress'] as String,
      balance: json['Balance'] as dynamic,
    );
  }
}
