import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:note/controllers/notes_provider.dart';
import 'package:note/services/locator.dart';
import 'package:note/services/navigation_service.dart';
import 'package:note/services/storage_services.dart';
import 'package:note/ui/shared/widgets/bottom_sheet.dart';
import 'package:note/ui/shared/widgets/card.dart';
import 'package:note/ui/shared/widgets/loading_indicator.dart';
import 'package:note/utils/resources/color_manager.dart';
import 'package:note/utils/resources/font_manager.dart';
import 'package:note/utils/resources/values_manager.dart';
import 'package:provider/provider.dart';

import '../../../utils/routes/routes_const.dart';
import '../../shared/widgets/alert.dart';
import '../../shared/widgets/button.dart';
import 'app_bar.dart';
import 'drawer.dart';
import '../../shared/widgets/sub_title.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({super.key});

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  @override
  Widget build(BuildContext context) {
    final notes = context.read<NotesProvider>();
    notes.token();
    return SafeArea(
      child: Consumer<NotesProvider>(builder: (context, provider, child) {
        if (provider.isValidToken) {
          return Scaffold(
            endDrawer: MyDrawer(),
            appBar: MyAppBar(),
            body: provider.isLoading
                ? LoadingIndiaor()
                : (provider.tasks.isEmpty
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Lottie.asset('assets/animation/note.json',
                              height: 350.h, width: 400.w, fit: BoxFit.contain),
                          Spaces.heightSpace(AppSize.s6.h),
                          SubTitle(
                              text: 'Create your first note !',
                              fontSize: FontSize.s20.sp),
                        ],
                      )
                    : ListView.builder(
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: provider.tasks.length,
                        itemBuilder: (context, index) => Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: AppPadding.p25.w,
                              vertical: AppPadding.p8.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Visibility(
                                visible: provider.filterNotes(index) == null
                                    ? false
                                    : true,
                                child: SubTitle(
                                    fontSize: FontSize.s16.sp,
                                    text: provider.filterNotes(index) ?? ''),
                              ),
                              Spaces.heightSpace(AppSize.s6.h),
                              NoteCard(
                                task: provider.tasks[index],
                              ),
                            ],
                          ),
                        ),
                      )),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                provider.noteController.clear();
                showModalBottomSheet(
                  isScrollControlled: true,
                  context:
                      locator<NavigationService>().navigatorKey.currentContext!,
                  builder: (context) => MyBottomSheet(
                    text: 'addNote'.tr(),
                    onPressed: () => provider.createTask(),
                  ),
                );
              },
              child: Icon(Icons.add, color: ColorManager.white),
            ),
          );
        } else {
          return MyAlert(
            widget: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('The session has expired, please log in again'),
                Spaces.heightSpace(20.h),
                Button(
                    onPressed: () {
                      locator<Storage>().removeToken();
                      locator<Storage>().writeBool(false);
                      locator<NavigationService>()
                          .pushReplacementNamed(RouteConstants.login);
                    },
                    widget: Text('logout'.tr())),
              ],
            ),
          );
        }
      }),
    );
  }
}
