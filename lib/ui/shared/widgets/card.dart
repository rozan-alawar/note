import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:note/controllers/notes_provider.dart';
import 'package:note/ui/shared/widgets/alert.dart';
import 'package:note/utils/resources/color_manager.dart';
import 'package:note/utils/resources/styles_manager.dart';
import 'package:note/utils/resources/values_manager.dart';
import 'package:provider/provider.dart';

import '../../../api/models/task.dart';
import '../../../controllers/theme_provider.dart';
import '../../../services/locator.dart';
import '../../../services/navigation_service.dart';
import '../../../utils/resources/font_manager.dart';
import 'bottom_sheet.dart';
import 'button.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({super.key, required this.task});
  final Task task;

  @override
  Widget build(BuildContext context) {
    return Consumer<NotesProvider>(
      builder: (context, provider, child) => Slidable(
        key: UniqueKey(),
        endActionPane: ActionPane(
          motion: ScrollMotion(),
          children: [
            Spaces.widthSpace(AppSize.s20.w),
            InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => MyAlert(
                    widget: Text('deleteQS'.tr()),
                    actions: [
                      Button(
                        width: 112.w,
                        isGradient: false,
                        height: 40.h,
                        onPressed: () => locator<NavigationService>().pop(),
                        widget: Text('cancle'.tr()),
                        color: ColorManager.grey,
                      ),
                      Spaces.widthSpace(AppSize.s32.w),
                      Button(
                        isGradient: false,
                        width: 112.w,
                        height: 40.h,
                        onPressed: () {
                          provider.deleteTask(task);
                          locator<NavigationService>().pop();
                        },
                        widget: Text('delete'.tr()),
                        color: ColorManager.red,
                      ),
                    ],
                  ),
                );
              },
              child: Image.asset(
                'assets/icons/delete.png',
                width: 68.w,
                height: 68.h,
                fit: BoxFit.scaleDown,
              ),
            ),
          ],
        ),
        startActionPane: ActionPane(
          motion: ScrollMotion(),
          children: [
            Spaces.widthSpace(AppSize.s20.w),
            InkWell(
              onTap: () {
                provider.noteController.text = task.title!;
                showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: (context) => MyBottomSheet(
                    text: 'updateNote'.tr(),
                    onPressed: () => provider.updateTask(task),
                  ),
                );
              },
              child: Image.asset(
                'assets/icons/edit.png',
                width: 68.w,
                height: 68.h,
                fit: BoxFit.scaleDown,
              ),
            ),
          ],
        ),
        child: Container(
          // alignment: Alignment.center,
          width: 365.w,
          height: 110.h,
          padding: EdgeInsets.all(AppPadding.p25),
          decoration: BoxDecoration(
              gradient: task.color == null
                  ? context.watch<ThemeProvider>().isDarkMode
                      ? ColorManager.darkLinearGradient
                      : ColorManager.lightLinearGradient
                  : null,
              borderRadius: BorderRadius.circular(AppSize.s10.r),
              color: task.color),
          child:
              Text(task.title!, style: getBoldStyle(fontSize: FontSize.s25.sp)),
        ),
      ),
    );
  }
}
