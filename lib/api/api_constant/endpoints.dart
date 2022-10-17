import 'package:dio/dio.dart';

class Endpoints {
  static const String baseUrl = 'http://demo-api.mr-dev.tech/api/';
  static const String register = 'students/auth/register';
  static const String login = 'students/auth/login';
  static const String logout = '/students/auth/logout';
  static const String tasks = '/tasks';
  static const String forgetPassword = '/students/auth/forget-password';
  static const String resetPassword = '/students/auth/reset-password';
  static const int connectTimeOut = 1000;
  static const int reciveTimeOut = 300;
  static const ResponseType responseType = ResponseType.json;
}
