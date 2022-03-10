import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'dart:convert';
import 'package:mobile_store_management/Backend/Interfaces/IEmployee.dart';

class EmployeeOperation implements IEmployee {
  var _formatter = new DateFormat('yyyy-MM-dd');
  var _now = new DateTime.now();

  String getTodayDate() {
    String formattedDate = _formatter.format(_now);
    return formattedDate;
  }

  //for DTR
  Future<bool> timeIn(String id, final String date) async {
    print('1 $date');

    var updateRequestLoad = json.encode({
      'id': id,
      'timeIn': date,
    });

    try {
      final response = await http.post(
        Uri.parse("http://10.0.2.2:8090/api/clockin"),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        },
        body: updateRequestLoad,
      );

      //if response is empty return false
      if (response.statusCode == 404) {
        return false;
      }

      if (response.statusCode == 202) {
        return true;
      }
    } catch (e) {
      print(e.toString());
      return false;
    }

    return true;
  }

  Future<bool> timeOut(String id, final String date) async {
    var adminUpdateLoad = json.encode({
      'id': id,
      'dateToday': getTodayDate().toString(),
      'timeOut': date,
    });

    try {
      final response = await http.post(
        Uri.parse("http://10.0.2.2:8090/api/clockout"),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        },
        body: adminUpdateLoad,
      );

      //if response is empty return false
      if (response.statusCode == 404) {
        return false;
      }

      if (response.statusCode == 202) {
        return true;
      }
    } catch (e) {
      print(e.toString());
      return false;
    }

    return true;
  }
}
