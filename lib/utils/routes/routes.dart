import 'package:flutter/material.dart';
import 'package:note/ui/pages/auth/change_password_screen.dart';
import 'package:note/ui/pages/auth/login_screen.dart';
import 'package:note/ui/pages/auth/signup_screen.dart';
import 'package:note/ui/pages/home/note_screen.dart';
import 'package:note/ui/shared/pages/no_internet.dart';
import 'package:note/utils/routes/routes_const.dart';

import '../../ui/pages/auth/forget_password.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteConstants.login:
        return MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        );
      case RouteConstants.signup:
        return MaterialPageRoute(
          builder: (context) => SignUpScreen(),
        );
      case RouteConstants.forgetPassword:
        return MaterialPageRoute(
          builder: (context) => ForgetPasswordScreen(),
        );
      case RouteConstants.resetPassword:
        return MaterialPageRoute(
          builder: (context) => ChangePasswordScreen(),
        );
      case RouteConstants.note:
        return MaterialPageRoute(
          builder: (context) => NoteScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => ErrorScreen(),
        );
    }
  }
}
