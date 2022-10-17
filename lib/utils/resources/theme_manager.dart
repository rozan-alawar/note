import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note/utils/resources/styles_manager.dart';
import 'package:note/utils/resources/values_manager.dart';
import 'package:note/utils/resources/font_manager.dart';

import 'color_manager.dart';

class MyThemes {
//dark theme ...
  static final darkTheme = ThemeData(
      brightness: Brightness.dark,
      colorScheme: ColorScheme.dark(),
      dialogTheme: DialogTheme(
        backgroundColor: ColorManager.bgColor,
        titleTextStyle: getSemiBoldStyle(
          color: ColorManager.white,
        ),
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: ColorManager.darkGrey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s15.r),
        ),
      ),
      scaffoldBackgroundColor: ColorManager.bgColor,

      // cardview theme
      cardTheme: const CardTheme(
          color: ColorManager.white,
          shadowColor: ColorManager.grey,
          elevation: AppSize.s4),
      // app bar theme
      appBarTheme: AppBarTheme(
        toolbarHeight: 70,
        elevation: AppSize.s0,
        shadowColor: ColorManager.grey,
        backgroundColor: ColorManager.transparent,
        iconTheme: const IconThemeData(
          color: ColorManager.teal,
        ),
        titleTextStyle: getBoldStyle(
          fontSize: FontSize.s43.sp,
          fonFamily: FontConstants.nunito,
        ),
      ),
      // button theme
      buttonTheme: const ButtonThemeData(
        shape: StadiumBorder(),
        disabledColor: ColorManager.grey,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: ColorManager.lightBlack,
        elevation: 20,
        splashColor: ColorManager.lightBlack,
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateProperty.all(ColorManager.teal),
      ),
      // elevated button them
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          textStyle: getSemiBoldStyle(
            color: ColorManager.white,
            fontSize: FontSize.s16.sp,
          ),
          elevation: 0,
          backgroundColor: ColorManager.transparent,
          foregroundColor: ColorManager.white,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: ColorManager.lightBlack,
        hintStyle: getRegularStyle(
          color: ColorManager.grey,
        ),
      ),

      //--------------------------------- text theme ----------------------------------
      textTheme: TextTheme(
          headline1: getBoldStyle(
            fontSize: FontSize.s43,
            fonFamily: FontConstants.nunito,
          ),
          headline3: getSemiBoldStyle(
            fontSize: FontSize.s18.sp,
            color: ColorManager.white,
          ),
          headline6: getRegularStyle(
            fontSize: FontSize.s16,
            color: ColorManager.grey,
          )),
      //--------------------------------- drawer theme ----------------------------------
      drawerTheme: DrawerThemeData(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        width: 200,
        backgroundColor: ColorManager.lightBlack,
      ),
      fontFamily: FontConstants.nunito);

//-------------------------------------------------------------------------------------
//--------------------------------- light theme --------------------------------
//-------------------------------------------------------------------------------------
  static final lighTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(),

    //app bar
    appBarTheme: AppBarTheme(
      toolbarHeight: 70,
      backgroundColor: ColorManager.teal,
      elevation: 0,
      titleTextStyle: getBoldStyle(
        fontSize: FontSize.s43.sp,
        fonFamily: FontConstants.nunito,
      ),
    ),
    //--------------------------------- button theme ----------------------------------
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorManager.transparent,
        elevation: 0,
      ),
    ),
    //--------------------------------- text theme ----------------------------------
    textTheme: TextTheme(
        headline1: getBoldStyle(
          fontSize: FontSize.s43,
          fonFamily: FontConstants.nunito,
        ),
        headline3: getSemiBoldStyle(
          fontSize: FontSize.s18,
          color: ColorManager.black,
        ),
        headline6: getRegularStyle(
          fontSize: FontSize.s16,
          color: ColorManager.darkGrey,
        )),
    //--------------------------------- floating action button theme ----------------------------------
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: ColorManager.teal,
      foregroundColor: ColorManager.white,
    ),
    //--------------------------------- bottom sheet theme ----------------------------------
    bottomSheetTheme: BottomSheetThemeData(backgroundColor: ColorManager.white),
    //--------------------------------- input decoration theme ----------------------------------

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: ColorManager.teal.withOpacity(0.1),
      hintStyle: getSemiBoldStyle(color: ColorManager.darkGrey),
    ),
    //--------------------------------- card theme ----------------------------------

    cardTheme: CardTheme(
      color: ColorManager.blue,
      elevation: 5,
    ),
    //--------------------------------- dialog theme ----------------------------------

    dialogTheme: DialogTheme(
      backgroundColor: ColorManager.white,
      titleTextStyle: getSemiBoldStyle(
        color: ColorManager.black,
      ),
    ),
    //--------------------------------- checkbox theme ----------------------------------
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateProperty.all(ColorManager.teal),
    ),
    //--------------------------------- drawer theme ----------------------------------
    drawerTheme: DrawerThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      width: 200,
      backgroundColor: ColorManager.white,
    ),
  );
}
