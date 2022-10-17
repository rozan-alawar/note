import 'package:note/api/models/task.dart';

class ReadTasks {
  bool? status;
  String? message;
  List<Task>? tasks;

  ReadTasks({this.status, this.message, this.tasks});

  ReadTasks.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      tasks = <Task>[];
      json['data'].forEach((v) {
        tasks!.add(Task.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.tasks != null) {
      data['data'] = this.tasks!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
