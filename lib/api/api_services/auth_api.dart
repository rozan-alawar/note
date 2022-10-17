import 'package:dio/dio.dart';
import 'package:note/api/api_constant/endpoints.dart';
import 'package:note/api/api_services/dio_client.dart';
import 'package:note/api/models/response.dart';

import '../../services/locator.dart';
import '../../services/storage_services.dart';

class AuthApi {
  final DioClient dioClient;

  AuthApi(this.dioClient);

  Future<AuthResponse> signUp({
    required String email,
    required String fullName,
    required String password,
    required String gender,
  }) async {
    try {
      final response = await dioClient.post(url: Endpoints.register, data: {
        "full_name": fullName,
        "email": email,
        "password": password,
        "gender": gender
      });
      final registerResponse = AuthResponse.fromJson(response.data);
      return registerResponse;
    } catch (e) {
      rethrow;
    }
  }

  Future<AuthResponse> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await dioClient.post(url: Endpoints.login, data: {
        "email": email,
        "password": password,
      });
      final loginResponse = AuthResponse.fromJson(response.data);
      return loginResponse;
    } catch (e) {
      rethrow;
    }
  }

  Future<AuthResponse> forgetPassword({
    required String email,
  }) async {
    try {
      final response =
          await dioClient.post(url: Endpoints.forgetPassword, data: {
        "email": email,
      });
      final loginResponse = AuthResponse.fromJson(response.data);
      return loginResponse;
    } catch (e) {
      rethrow;
    }
  }

  Future<AuthResponse> resetPassword({
    required String email,
    required int code,
    required String password,
    required String confirmPassword,
  }) async {
    try {
      final response =
          await dioClient.post(url: Endpoints.resetPassword, data: {
        "email": email,
        "code": code,
        "password": password,
        "password_confirmation": confirmPassword
      });
      final resetResponse = AuthResponse.fromJson(response.data);
      return resetResponse;
    } catch (e) {
      rethrow;
    }
  }

  Future<AuthResponse> logout() async {
    try {
      String? token = await locator<Storage>().getToken();

      final response = await dioClient.get(
          url: Endpoints.logout,
          options: Options(
              headers: {'Authorization': token, 'accept': "application/json"}));
      AuthResponse logoutResponse = AuthResponse.fromJson(response.data);
      return logoutResponse;
    } catch (e) {
      rethrow;
    }
  }
}
