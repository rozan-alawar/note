import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note/ui/pages/home/search_screen.dart';
import 'package:note/utils/resources/color_manager.dart';
import 'package:note/utils/resources/values_manager.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Text(
        'note'.tr(),
      ),
      actions: [
        GestureDetector(
          onTap: () => showSearch(context: context, delegate: SearchScreen()),
          child: Container(
            margin: EdgeInsets.symmetric(vertical: AppMargin.m16.h),
            width: AppSize.s40.w,
            height: AppSize.s40.h,
            decoration: BoxDecoration(
              color: ColorManager.lightBlack,
              borderRadius: BorderRadius.circular(AppSize.s8.r),
            ),
            child: Icon(Icons.search),
          ),
        ),
        Spaces.widthSpace(AppSize.s6.w),
        Builder(builder: (context) {
          return InkWell(
            onTap: () => Scaffold.of(context).openEndDrawer(),
            child: Image.asset(
              "assets/images/splash_screen.png",
              width: 55.w,
              height: 55.h,
              fit: BoxFit.scaleDown,
            ),
          );
        }),
        Spaces.widthSpace(AppSize.s20.w)
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(70);
}
