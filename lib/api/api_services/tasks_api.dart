import 'package:dio/dio.dart';
import 'package:note/api/api_constant/endpoints.dart';
import 'package:note/api/api_services/dio_client.dart';
import 'package:note/api/models/create_task.dart';
import 'package:note/api/models/response.dart';

import '../../services/locator.dart';
import '../../services/storage_services.dart';

class TasksApi {
  final DioClient _dioClient;

  TasksApi(this._dioClient);

  Future<CreatTask> createTask(String taskTitle) async {
    try {
      String? token = await locator<Storage>().getToken();

      final response = await _dioClient.post(
        url: Endpoints.tasks,
        data: {"title": taskTitle},
        options: Options(
          headers: {'Authorization': token, 'accept': "application/json"},
        ),
      );
      CreatTask createTaskResponse = CreatTask.fromJson(response.data);
      return createTaskResponse;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> readTask() async {
    try {
      String? token = await locator<Storage>().getToken();

      final response = await _dioClient.get(
        url: Endpoints.tasks,
        options: Options(
          headers: {'Authorization': token, 'accept': "application/json"},
        ),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<AuthResponse> delete(int id) async {
    try {
      String? token = await locator<Storage>().getToken();

      final response = await _dioClient.delete(
        url: '${Endpoints.tasks}/$id',
        options: Options(
          headers: {'Authorization': token, 'accept': "application/json"},
        ),
      );
      AuthResponse deleteResponse = AuthResponse.fromJson(response.data);
      return deleteResponse;
    } catch (e) {
      rethrow;
    }
  }

  Future<AuthResponse> updateTask(int id, String taskTitle) async {
    try {
      String? token = await locator<Storage>().getToken();

      final response = await _dioClient.put(
        url: '${Endpoints.tasks}/$id',
        data: {
          "title": taskTitle,
        },
        options: Options(
          headers: {'Authorization': token, 'accept': "application/json"},
        ),
      );
      AuthResponse updateResponse = AuthResponse.fromJson(response.data);
      return updateResponse;
    } catch (e) {
      rethrow;
    }
  }
}
