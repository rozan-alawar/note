import 'package:flutter/material.dart';

class Task {
  String? title;
  dynamic studentId;
  String? updatedAt;
  String? createdAt;
  int? id;
  bool? isDone;
  Color? color;
  Task(
      {this.title,
      this.studentId,
      this.updatedAt,
      this.createdAt,
      this.id,
      this.isDone});

  Task.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    studentId = json['student_id'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
    isDone = json['is_done'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['student_id'] = this.studentId;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    data['is_done'] = this.isDone;
    return data;
  }
}
