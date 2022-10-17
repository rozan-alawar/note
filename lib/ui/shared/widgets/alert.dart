import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note/controllers/notes_provider.dart';
import 'package:note/utils/resources/values_manager.dart';
import 'package:provider/provider.dart';

class MyAlert extends StatelessWidget {
  const MyAlert({Key? key, required this.widget, this.actions})
      : super(key: key);

  final Widget widget;
  final List<Widget>? actions;
  @override
  Widget build(BuildContext context) {
    return Consumer<NotesProvider>(
      builder: (context, porvider, child) => AlertDialog(
          actionsAlignment: MainAxisAlignment.center,
          actionsPadding: EdgeInsets.all(AppPadding.p25.h),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          icon: Image.asset(
            'assets/icons/info.png',
            height: 36.h,
            width: 36.w,
            fit: BoxFit.scaleDown,
          ),
          title: widget,
          actions: actions),
    );
  }
}
