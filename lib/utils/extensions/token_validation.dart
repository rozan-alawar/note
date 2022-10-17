import 'package:dio/dio.dart';
import 'package:note/api/api_services/tasks_api.dart';

import '../../services/locator.dart';

class Token {
  static Future<bool> isValidToken(String? token) async {
    bool isValid = true;
    try {
      final response = await locator<TasksApi>().readTask();
      if (response.statusCode == 401) {
        return isValid = false;
      } else {
        return isValid = true;
      }
    } on DioError catch (err) {
      return isValid = false;
      print(err.message);
    }
  }
}
