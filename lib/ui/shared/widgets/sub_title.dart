import 'package:flutter/material.dart';
import '../../../utils/resources/font_manager.dart';

class SubTitle extends StatelessWidget {
  const SubTitle({
    required this.text,
    this.fontSize = FontSize.s24,
    Key? key,
  }) : super(key: key);

  final String text;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style:
          Theme.of(context).textTheme.headline6!.copyWith(fontSize: fontSize),
    );
  }
}
