import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note/controllers/notes_provider.dart';
import 'package:note/controllers/theme_provider.dart';
import 'package:note/services/locator.dart';
import 'package:note/services/storage_services.dart';
import 'package:note/utils/resources/theme_manager.dart';
import 'package:note/utils/routes/routes.dart';
import 'package:provider/provider.dart';

import 'controllers/auth_provider.dart';
import 'services/navigation_service.dart';
import 'services/snack_bar_service.dart';
import 'utils/routes/routes_const.dart';

void main() async {
  await WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await setupLocator();
  await Storage.initSP();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => NotesProvider()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: EasyLocalization(
        saveLocale: false,
        path: 'assets/l10n',
        fallbackLocale: Locale('en'),
        supportedLocales: [
          Locale('en'),
          Locale('ar'),
        ],
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeMode = context.watch<ThemeProvider>();
    return ScreenUtilInit(
      designSize: Size(415, 900),
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        navigatorKey: locator<NavigationService>().navigatorKey,
        scaffoldMessengerKey: locator<SnackBarSrevie>().scaffoldMessengerKey,
        theme: MyThemes.lighTheme,
        darkTheme: MyThemes.darkTheme,
        themeMode: themeMode.themeMode,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RouteGenerator.generateRoute,
        initialRoute:
            Storage().readBool() ? RouteConstants.note : RouteConstants.login,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
      ),
    );
  }
}
