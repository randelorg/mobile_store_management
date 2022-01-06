import 'Person_model.dart';

class CollectorModel extends PersonModel {

  String? collectorId;
  String? username;
  String? password;
  List<dynamic>? userImage;

  get getCollectorId => this.collectorId;
  set setCollectorId(collectorId) => this.collectorId = collectorId;

  get getUsername => this.username;
  set setUsername(username) => this.username = username;

  get getPassword => this.password;
  set setPassword(password) => this.password = password;

  get getUserImage => this.userImage;
  set setUserImage(userImage) => this.userImage = userImage;

  CollectorModel.empty() : super.empty();

  CollectorModel.full(
      String collectorId,
      String username,
      String password,
      String firstname,
      String lastname,
      String mobileNumber,
      String homeAddress,
      List<dynamic> userImage)
      : super.partial(firstname, lastname, mobileNumber, homeAddress) {
    this.collectorId = collectorId;
    this.username = username;
    this.password = password;
    this.userImage = userImage;
  }

  CollectorModel.fullJson(
      {this.collectorId,
      this.username,
      this.password,
      personId,
      firstname,
      lastname,
      mobileNumber,
      homeAddress,
      this.userImage})
      : super.full(personId, firstname, lastname, mobileNumber, homeAddress) {
    this.username = username;
    this.password = password;
    this.userImage = userImage;
  }

  CollectorModel.adminOnlyJson({
    this.collectorId,
    this.username,
    this.password,
  }) : super.empty() {
    this.collectorId = collectorId;
    this.username = username;
    this.password = password;
  }

  factory CollectorModel.fromJson(Map<String, dynamic> json) {
    return CollectorModel.fullJson(
      collectorId: json["EmployeeID"] as String,
      username: json["Username"] as String,
      password: json["Password"] as String,
      personId: json["PersonID"] as int,
      firstname: json["Firstname"] as String,
      lastname: json["Lastname"] as String,
      mobileNumber: json["MobileNumber"] as String,
      homeAddress: json["HomeAddress"] as String,
      userImage: json["UserImage"]["data"] as List<dynamic>,
    );
  }
}