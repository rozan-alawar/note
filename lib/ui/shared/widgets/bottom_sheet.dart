import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note/controllers/notes_provider.dart';
import 'package:note/ui/shared/widgets/button.dart';
import 'package:note/ui/shared/widgets/sub_title.dart';
import 'package:note/ui/shared/widgets/text_field.dart';
import 'package:note/utils/resources/font_manager.dart';
import 'package:note/utils/resources/values_manager.dart';
import 'package:provider/provider.dart';

import '../../../utils/resources/color_manager.dart';
import 'color_palett.dart';
import 'loading_indicator.dart';

class MyBottomSheet extends StatelessWidget {
  const MyBottomSheet({super.key, required this.onPressed, required this.text});
  final void Function() onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    return StatefulBuilder(
      builder: (context, setState) => Padding(
        padding: EdgeInsetsDirectional.only(
            bottom: mediaQueryData.viewInsets.bottom),
        child: Consumer<NotesProvider>(
          builder: (context, provider, child) => Container(
            padding: EdgeInsets.symmetric(
                horizontal: AppPadding.p25.w, vertical: AppPadding.p20),
            height: 350,
            child: Form(
              key: provider.formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SubTitle(
                        text: text,
                        fontSize: FontSize.s22.sp,
                      ),
                      Spacer(),
                      ColorPalet(),
                    ],
                  ),
                  Spaces.heightSpace(AppSize.s16.h),
                  MyTextField(
                    isTextArea: true,
                    textInputFormatter: [LengthLimitingTextInputFormatter(15)],
                    controller: provider.noteController,
                    hintText: 'typeSomething'.tr(),
                    prefixIcon: null,
                    validator: (value) => value!.isEmpty || value.length < 3
                        ? 'newNoteValidation'.tr()
                        : null,
                  ),
                  Spaces.heightSpace(AppSize.s20.h),
                  Consumer<NotesProvider>(
                    builder: (context, provider, child) => provider.isLoading
                        ? AbsorbPointer(
                            child: Button(
                              isGradient: false,
                              onPressed: () {},
                              widget: LoadingIndiaor(),
                              color: ColorManager.grey,
                            ),
                          )
                        : Button(
                            onPressed: onPressed,
                            widget: Text('save'.tr()),
                          ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
