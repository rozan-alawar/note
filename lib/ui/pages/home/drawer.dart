import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:note/controllers/theme_provider.dart';
import 'package:note/services/locator.dart';
import 'package:note/services/snack_bar_service.dart';
import 'package:note/services/storage_services.dart';
import 'package:note/ui/shared/widgets/alert.dart';
import 'package:note/ui/shared/widgets/button.dart';
import 'package:note/utils/resources/color_manager.dart';
import 'package:note/utils/resources/values_manager.dart';
import 'package:provider/provider.dart';

import '../../../controllers/auth_provider.dart';
import '../../../services/navigation_service.dart';
import '../../../utils/resources/storage_keys.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, provider, child) => Drawer(
        child: Column(
          children: [
            Spaces.heightSpace(20),
            DrawerAction(
              text: 'language'.tr(),
              iconData: Icons.language,
              onTap: () => showDialog(
                context: context,
                builder: (context) => MyAlert(
                  widget: Column(
                    children: [
                      Text('language'.tr()),
                      Spaces.heightSpace(AppSize.s20),
                      Button(
                        onPressed: () {
                          context.setLocale(Locale('en'));
                          locator<Storage>().writeString(Keys.Locale, 'en');
                          locator<NavigationService>().pop();
                        },
                        widget: Text('English'),
                        color: ColorManager.lightBlack,
                        isGradient: false,
                      ),
                      Spaces.heightSpace(AppSize.s10),
                      Button(
                        onPressed: () {
                          context.setLocale(Locale('ar'));
                          locator<Storage>().writeString(Keys.Locale, 'ar');

                          locator<NavigationService>().pop();
                        },
                        widget: Text('Arbic'),
                        color: ColorManager.lightBlack,
                        isGradient: false,
                      )
                    ],
                  ),
                ),
              ),
            ),
            Spaces.heightSpace(10),
            Consumer<ThemeProvider>(
              builder: (context, provider, child) => DrawerAction(
                text: provider.isDarkMode ? 'dark'.tr() : 'light'.tr(),
                iconData: provider.isDarkMode
                    ? Icons.dark_mode_outlined
                    : Icons.light_mode,
                onTap: () => provider.toogleTheme(!provider.isDarkMode),
              ),
            ),
            Spaces.heightSpace(10),
            DrawerAction(
              text: 'share'.tr(),
              iconData: Icons.share,
              onTap: () {
                Scaffold.of(context).closeEndDrawer();
                locator<SnackBarSrevie>().showSnackBar('Shared!');
              },
            ),
            Spaces.heightSpace(10),
            DrawerAction(
                onTap: () => showDialog(
                    context: context,
                    builder: (context) => MyAlert(widget: Text('lorem'.tr()))),
                text: 'aboutUs'.tr(),
                iconData: Icons.info_outline_rounded),
            Spaces.heightSpace(10),
            DrawerAction(
              text: 'logout'.tr(),
              iconData: Icons.logout_outlined,
              onTap: () => provider.logout(),
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerAction extends StatelessWidget {
  const DrawerAction({
    Key? key,
    required this.iconData,
    required this.text,
    this.onTap,
  }) : super(key: key);
  final IconData iconData;
  final String text;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Icon(
        iconData,
        color: ColorManager.teal,
      ),
      title: Text(
        text,
        style: Theme.of(context).textTheme.headline3,
      ),
    );
  }
}
