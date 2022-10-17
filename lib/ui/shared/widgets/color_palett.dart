import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note/controllers/theme_provider.dart';
import 'package:note/utils/resources/color_manager.dart';
import 'package:provider/provider.dart';

import '../../../utils/resources/values_manager.dart';

class ColorPalet extends StatelessWidget {
  const ColorPalet({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Color? color;

    return Consumer<ThemeProvider>(
      builder: (context, provider, child) => Wrap(
          children: List.generate(
        5,
        (index) {
          Map<int, Color> colors = {
            0: ColorManager.lightPurple,
            1: ColorManager.lightRed,
            2: ColorManager.lightGreen,
            3: ColorManager.lightYellow,
            4: ColorManager.lightBlue
          };
          color = colors[index];

          return Padding(
            padding: EdgeInsets.symmetric(horizontal: AppPadding.p5.w),
            child: GestureDetector(
              onTap: () {
                provider.cardColor(colors[index]);
                provider.selectedColor(index);
              },
              child: CircleAvatar(
                backgroundColor: color,
                radius: AppSize.s15.r,
                child: provider.selectedIndex == index
                    ? Icon(
                        Icons.check,
                        color: ColorManager.white,
                      )
                    : SizedBox(),
              ),
            ),
          );
        },
      )),
    );
  }
}
