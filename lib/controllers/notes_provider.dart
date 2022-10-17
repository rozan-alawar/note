import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:note/api/api_services/tasks_api.dart';
import 'package:note/api/models/task.dart';
import 'package:note/controllers/theme_provider.dart';
import 'package:note/services/locator.dart';
import 'package:provider/provider.dart';

import '../api/models/read_tasks.dart';
import '../services/navigation_service.dart';
import '../services/snack_bar_service.dart';
import '../services/storage_services.dart';
import '../utils/extensions/token_validation.dart';
import '../utils/resources/color_manager.dart';

class NotesProvider with ChangeNotifier {
  bool isValidToken = true;
  List<Task> tasks = [];
  Set<String> dates = {};
  final noteController = TextEditingController();
  bool isLoading = false;
  final formKey = GlobalKey<FormState>();

  NotesProvider() {
    readTasks();
  }
  token() async {
    String? text = await locator<Storage>().getToken();
    isValidToken = await Token.isValidToken(text);
    notifyListeners();
  }

  filterNotes(int index) {
    String date = StringToDateFormate(tasks[index].createdAt!);
    if (index == 0) {
      return StringToDateFormate(tasks[index].createdAt!);
    } else if (index > 0) {
      for (int i = 0; i < tasks.length; i++) {
        if (date != StringToDateFormate(tasks[index - 1].createdAt!)) {
          return StringToDateFormate(tasks[index].createdAt!);
        }
      }
    }

    return null;
  }

  createTask() async {
    if (formKey.currentState!.validate()) {
      try {
        isLoading = true;
        notifyListeners();
        final response =
            await locator<TasksApi>().createTask(noteController.text.trim());
        if (response.status == true) {
          isLoading = false;
          tasks.add(response.task!);
          response.task!.color = Provider.of<ThemeProvider>(
                  locator<NavigationService>().navigatorKey.currentContext!,
                  listen: false)
              .color;
          tasks.sort(
            (a, b) => StringToDateFormate(b.createdAt!)
                .compareTo(StringToDateFormate(a.createdAt!)),
          );
          notifyListeners();
          locator<NavigationService>().pop();
          locator<SnackBarSrevie>()
              .showSnackBar(response.message!, color: ColorManager.teal);
          noteController.clear();
        }
      } on DioError catch (err) {
        isLoading = false;
        notifyListeners();
        locator<SnackBarSrevie>().showSnackBar(err.response!.data['message']);
      }
    }
  }

  readTasks() async {
    try {
      isLoading = true;
      notifyListeners();
      final response = await locator<TasksApi>().readTask();
      ReadTasks readTaskResponse = ReadTasks.fromJson(response.data);
      if (readTaskResponse.status == true) {
        tasks = readTaskResponse.tasks!;
        tasks.sort(
          (a, b) => StringToDateFormate(b.createdAt!)
              .compareTo(StringToDateFormate(a.createdAt!)),
        );
        isLoading = false;
        notifyListeners();
      }
    } on DioError catch (err) {
      isLoading = false;
      notifyListeners();
      locator<SnackBarSrevie>().showSnackBar(err.response!.data['message']);
    }
  }

  deleteTask(Task task) async {
    try {
      await locator<TasksApi>().delete(task.id!);
      tasks.remove(task);

      notifyListeners();
    } on DioError catch (err) {
      print(err.message);
      locator<SnackBarSrevie>().showSnackBar(err.response!.data['message']);
    }
  }

  updateTask(Task task) async {
    try {
      isLoading = true;
      notifyListeners();
      final response = await locator<TasksApi>()
          .updateTask(task.id!, noteController.text.trim());
      tasks[tasks.indexOf(task)] = task..title = noteController.text;
      locator<NavigationService>().pop();
      notifyListeners();
      if (response.status == true) {
        isLoading = false;
        notifyListeners();
        // readTasks();
        locator<SnackBarSrevie>()
            .showSnackBar(response.message!, color: ColorManager.teal);
        noteController.clear();
        notifyListeners();
      }
    } on DioError catch (err) {
      isLoading = false;
      notifyListeners();
      locator<SnackBarSrevie>().showSnackBar(err.response!.data['message']);
    }
  }

  String StringToDateFormate(String date) {
    DateFormat outputFormat = DateFormat('dd, MMM, yyyy');
    String outputDate = outputFormat.format(DateTime.parse(date));
    return outputDate;
  }
}
