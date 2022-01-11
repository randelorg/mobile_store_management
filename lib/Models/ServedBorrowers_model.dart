class ServedBorrowersModel {
  
  int? borrowerId;
  String? name;
  dynamic amount;

  get getBorrowerId => this.borrowerId;
  set setBorrowerId(int borrowerId) => this.borrowerId = borrowerId;

  get getName => this.name;
  set setName(name) => this.name = name;

  get getAmount => this.amount;
  set setAmount(amount) => this.amount = amount;

  ServedBorrowersModel.empty();

  ServedBorrowersModel.full(int borrowerId, String name, dynamic amount){
    this.borrowerId = borrowerId;
    this.name = name;
    this.amount = amount;
  }
}
