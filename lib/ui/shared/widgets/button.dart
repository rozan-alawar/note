import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../controllers/theme_provider.dart';
import '../../../utils/resources/color_manager.dart';

class Button extends StatelessWidget {
  final void Function() onPressed;
  final Widget widget;
  final double width;
  final double height;
  final double raduis;
  final Color color;
  final bool isGradient;

  const Button({
    Key? key,
    required this.onPressed,
    required this.widget,
    this.height = 44,
    this.width = 360,
    this.raduis = 6,
    this.color = ColorManager.transparent,
    this.isGradient = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(raduis),
          gradient: isGradient
              ? (context.watch<ThemeProvider>().isDarkMode
                  ? ColorManager.darkLinearGradient
                  : ColorManager.lightLinearGradient)
              : LinearGradient(
                  colors: [color, color],
                )),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          fixedSize: Size(width.w, height.h),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(raduis)),
        ),
        child: widget,
      ),
    );
  }
}
