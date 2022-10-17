import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LottieBuilder.asset('assets/animation/no_internet.json'),
      ),
    );
  }
}
