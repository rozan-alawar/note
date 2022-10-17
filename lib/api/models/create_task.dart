import 'task.dart';

class CreatTask {
  bool? status;
  String? message;
  Task? task;

  CreatTask({this.status, this.message, this.task});

  CreatTask.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    task = json['data'] != null ? new Task.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.task != null) {
      data['data'] = this.task!.toJson();
    }
    return data;
  }
}
