import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mobile_store_management/Backend/Interfaces/ILogin.dart';
import 'package:mobile_store_management/Backend/Session.dart';
import 'package:mobile_store_management/Backend/Utility/Mapping.dart';
import 'package:mobile_store_management/Helpers/Hashing_helper.dart';
import 'package:mobile_store_management/Models/Admin_model.dart';
import 'package:mobile_store_management/Models/Collector_model.dart';

class LoginOperation implements ILogin {
  var hash = Hashing();
  // var admin = AdminModel.empty();

  @override
  void logout() {
    // TODO: implement logout
  }

  @override
  Future<bool> mainLogin(String role, String username, String password) async {
    //holds the json body
    var entity;

    switch (role) {
      case 'Administrator':
        entity = json
            .encode({"Username": username, "Password": hash.encrypt(password)});
        break;
      case 'Collector':
        entity = json.encode({
          "Role": role,
          "Username": username.toString(),
          "Password": hash.encrypt(password)
        });
        break;
      default:
    }

    final response = await http.post(
      Uri.parse('http://10.0.2.2:8090/api/login'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      },
      body: entity,
    );

    //if response is empty return false
    if (response.statusCode == 404) {
      return false;
    }

    try {
      //if response is not empty
      bool status = await _users(response, role);

      if (!status) return false;
    } catch (e) {
      print(e.toString());
    }
    return true;
  }

  Future<bool> _users(http.Response response, String role) async {
    try {
      switch (role.replaceAll(' ', '')) {
        case 'Administrator':
          Map<String, dynamic> adminMap =
              jsonDecode(response.body)[0] as Map<String, dynamic>;

          var admin = AdminModel.fromJson(adminMap);
          Mapping.adminList.add(
            AdminModel.full(
              admin.getAdminId,
              admin.getUsername,
              admin.getPassword,
              admin.getFirstname,
              admin.getLastname,
              admin.getMobileNumber,
              admin.getHomeAddress,
              admin.getUserImage,
            ),
          );

          await setSession(admin.toString(), true, role);
          break;

        case 'Collector':
          Map<String, dynamic> empMap =
              jsonDecode(response.body)[0] as Map<String, dynamic>;

          var emp = CollectorModel.fromJson(empMap);
          Mapping.collectorList.add(
            CollectorModel.full(
              emp.getCollectorId,
              emp.getRole,
              emp.getUsername,
              emp.getFirstname,
              emp.getLastname,
              emp.getMobileNumber,
              emp.getHomeAddress,
              emp.getUserImage,
            ),
          );
          await setSession(emp.toString(), true, role);
          break;
        default:
      }
    } catch (e) {
      print(e.toString());
      return false;
    }
    return true;
  }

  Future<void> setSession(String id, bool status, String role) async {
    await Session.setValues(id, status, role);
  }
}
