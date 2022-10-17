import 'package:flutter/material.dart';
import 'package:note/utils/resources/color_manager.dart';

class PageFooter extends StatelessWidget {
  const PageFooter(
      {Key? key,
      required this.firsText,
      required this.secondText,
      required this.onPressed})
      : super(key: key);

  final String firsText;
  final String secondText;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(firsText, style: Theme.of(context).textTheme.headline6),
        TextButton(
          onPressed: onPressed,
          child: Text(
            secondText,
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(color: ColorManager.teal),
          ),
        )
      ],
    );
  }
}
