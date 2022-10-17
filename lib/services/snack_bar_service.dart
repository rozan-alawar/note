import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note/utils/resources/font_manager.dart';
import 'package:note/utils/resources/styles_manager.dart';
import 'package:note/utils/resources/values_manager.dart';

import '../utils/resources/color_manager.dart';

class SnackBarSrevie {
  final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  showSnackBar(String content, {Color color = ColorManager.grey}) {
    scaffoldMessengerKey.currentState!.showSnackBar(
      SnackBar(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.s15.r)),
        behavior: SnackBarBehavior.floating,
        width: 300,
        backgroundColor: color,
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              'assets/images/splash_screen.png',
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
            Spaces.widthSpace(AppSize.s20.w),
            Text(
              content,
              style: getSemiBoldStyle(
                  color: ColorManager.white, fontSize: FontSize.s12.sp),
            ),
          ],
        ),
      ),
    );
  }
}
