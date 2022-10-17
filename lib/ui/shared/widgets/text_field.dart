import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note/utils/resources/font_manager.dart';

import '../../../utils/resources/color_manager.dart';
import '../../../utils/resources/values_manager.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({
    required this.controller,
    required this.hintText,
    required this.prefixIcon,
    required this.validator,
    this.ispassword = false,
    this.isTextArea = false,
    this.onChanged,
    this.textInputFormatter,
    this.counterText = '',
    Key? key,
  }) : super(key: key);

  final String hintText;
  final Widget? prefixIcon;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool ispassword;
  final bool isTextArea;
  final List<TextInputFormatter>? textInputFormatter;
  final void Function(String)? onChanged;
  final bool isVisible = true;
  final String counterText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: isTextArea ? 15 : null,
      inputFormatters: textInputFormatter,
      style: Theme.of(context)
          .textTheme
          .headline3!
          .copyWith(fontSize: FontSize.s18.sp),
      maxLines: isTextArea ? 5 : 1,
      controller: controller,
      obscureText: ispassword ? isVisible : false,
      decoration: InputDecoration(
        prefixIcon: prefixIcon == null
            ? prefixIcon
            : Padding(
                padding: EdgeInsets.only(bottom: AppPadding.p5.h),
                child: prefixIcon,
              ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSize.s10.r),
            borderSide: BorderSide.none),
        focusColor: ColorManager.teal,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.s10.r),
          borderSide: BorderSide(color: ColorManager.teal),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(
            AppSize.s10.r,
          ),
        ),
        hintText: hintText,
      ),
      validator: validator,
      onChanged: onChanged,
    );
  }
}
