import 'package:flutter/cupertino.dart';

class NavigationService {
  final navigatorKey = GlobalKey<NavigatorState>();

  pushNamed({required String routeName, Object? argument}) {
    navigatorKey.currentState!.pushNamed(routeName, arguments: argument);
  }

  pushReplacementNamed(String routeName) {
    navigatorKey.currentState!.pushReplacementNamed(routeName);
  }

  pop() {
    navigatorKey.currentState!.pop();
  }
}
